/* Decompiled CreateFile/ReadFile/WriteFile/SetFilePointer/CloseHandle- shaped coredll wrapper
   thunks (win_file_exists, open_existing_file_rw, close_file_handle, open_file_for_read,
   open_existing_file_rw_alt, seek_file_handle, read_file_handle, write_file_handle)... */
#include "headers/winfile_wrappers.h"
#include "headers/debug.h"
#include <stdio.h>
#include <stdlib.h>



// was FUN_000226e8 -- CreateFile(GENERIC_READ, OPEN_EXISTING) immediately followed by CloseHandle:
// a "does this file exist" probe, not a real open.
int win_file_exists(char *path, int reserved)
{
  /* BUG FIX (unit-testing-framework merge): the converted path was held in an `undefined4`,
     truncating load_string_resource's real pointer -- same class as that function's own fix. */
  char *converted_path = (char *)load_string_resource(path);
  int handle = CreateFileW(converted_path, 0x80000000, 1, 0, 3, 0x80, 0);

  if (handle == -1) {
    return -1;
  }
  CloseHandle(handle);
  return 0;
}



/* --- Real file I/O These 7 functions are CreateFile/ReadFile/WriteFile/SetFilePointer/
   CloseHandle-shaped wrappers around coredll ordinals... */

// was FUN_0002273c
int open_existing_file_rw(char *path)
{
  return (int)uw_file_open_write(path, 0);
}



// was FUN_000227b8
/* All original callers pass a filename: this is the DeleteFile-shaped
   wrapper used to replace an archive and remove its temporary file. */
bool close_file_handle(char *filename)
{
  char resolved_path[4096];

  return uw_resolve_win_path(filename, resolved_path, sizeof resolved_path) && remove(resolved_path) == 0;
}



// was FUN_000227d4
int open_file_for_read(const char *path)
{
  return (int)uw_file_open_read(path);
}



/* Was `uw_file_open_read(param_1)` (read-only, "rb") -- confirmed WRONG via Ghidra headless: the
   real ARM body (0x22810) calls `CreateFileW(fname, 0xc0000000, 1, 0, 3, 0x80, 0)` --
   GENERIC_READ|GENERIC_WRITE (0xc0000000), OPEN_EXISTING (disposition 3) -- a read-write handle... */
// was FUN_00022810
int open_existing_file_rw_alt(const char *path)
{
  return (int)uw_file_open_write(path, 0);
}




// was FUN_00022850
int seek_file_handle(int handle, int offset, int whence)
{
  return (int)uw_file_seek(handle, offset, whence);
}



// was FUN_0002285c
int read_file_handle(int handle, void *buffer, uint byte_count)
{
  return (int)uw_file_read(handle, buffer, byte_count);
}



// was FUN_00022884
int write_file_handle(int handle, const void *buffer, uint byte_count)
{
  return (int)uw_file_write(handle, buffer, byte_count);
}
