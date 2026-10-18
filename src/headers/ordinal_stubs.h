#ifndef ORDINAL_STUBS_H
#define ORDINAL_STUBS_H

/* The CE ordinal stubs below reuse the names of MSVC CRT functions that mingw declares with
 * different signatures. Pull the CRT headers in first, then rename ours so both coexist. */
#ifdef _WIN32
#include <stdlib.h>
#include <string.h>
#include <wchar.h>
#include <ctype.h>
/* The stubs also share names with Win32 API exports that SDL links against; keep ours distinct. */
#define CloseHandle uwce_CloseHandle
#define CreateFileW uwce_CreateFileW
#define CreateWindowExW uwce_CreateWindowExW
#define DefWindowProcW uwce_DefWindowProcW
#define DeleteObject uwce_DeleteObject
#define DialogBoxIndirectParamW uwce_DialogBoxIndirectParamW
#define DispatchMessageW uwce_DispatchMessageW
#define EndDialog uwce_EndDialog
#define EnterCriticalSection uwce_EnterCriticalSection
#define GetLastError uwce_GetLastError
#define GetSystemMetrics uwce_GetSystemMetrics
#define GetTickCount uwce_GetTickCount
#define LocalFree uwce_LocalFree
#define PeekMessageW uwce_PeekMessageW
#define PostMessageW uwce_PostMessageW
#define ReadFile uwce_ReadFile
#define RegCloseKey uwce_RegCloseKey
#define RegisterClassW uwce_RegisterClassW
#define RegOpenKeyExW uwce_RegOpenKeyExW
#define RegQueryValueExW uwce_RegQueryValueExW
#define SetFilePointer uwce_SetFilePointer
#define SetForegroundWindow uwce_SetForegroundWindow
#define ShowWindow uwce_ShowWindow
#define Sleep uwce_Sleep
#define SystemParametersInfoW uwce_SystemParametersInfoW
#define TranslateMessage uwce_TranslateMessage
#define waveOutClose uwce_waveOutClose
#define waveOutOpen uwce_waveOutOpen
#define waveOutPrepareHeader uwce_waveOutPrepareHeader
#define waveOutReset uwce_waveOutReset
#define waveOutUnprepareHeader uwce_waveOutUnprepareHeader
#define waveOutWrite uwce_waveOutWrite
#define WideCharToMultiByte uwce_WideCharToMultiByte
#define WriteFile uwce_WriteFile
#define _wcsicmp uw_wcsicmp
#define _isctype uw_isctype
#define _itoa uw_itoa
#define _ltoa uw_ltoa
#define _strlwr uw_strlwr
#define _strupr uw_strupr
#endif

/* ordint_divmod's return: both halves of one ARM soft-division, named
 * instead of relying on a second, nonexistent "return value" read back
 * from a leftover register (see ordint_divmod's own comment). */
typedef struct {
    int quot;
    int rem;
} divmod_result;

void uw_pump_events();

long EnterCriticalSection(long critical_section, long arg2, void *arg3, long arg4);
long GetSystemTime(void *system_time);
void *LocalAlloc(long flags, long byte_count);
void *LocalReAlloc(void *block, long byte_count, long flags);
long LocalSize(void *block);
long RemoteLocalReAlloc(void *arg1, void *arg2, long arg3, long arg4, long arg5);
long HeapReAlloc(void *heap);
long ce_wcscat();
long ce_wcscpy(char *destination, const char *source);
long ce_wcslen();
long Random();
long SystemParametersInfoW(unsigned int action, unsigned int cb, void *buf, unsigned int fWinIni);
long RegisterClassW(void *window_class);
long CopyRect(void *rect);
long CreateDirectoryW(const char *path, void *security);
long RemoveDirectoryW();
long CopyFileW(const char *source, const char *destination, int fail_if_exists);
long create_directory_path(void *path_ptr);
long FindFirstFileW(void *path_ptr, unsigned int *out_attrs);
long CreateFileW(const char *path, long access, long share_mode, void *security, long creation, long attributes, void *template_file);
long ReadFile(long file, void *buffer, long byte_count, void *bytes_read, void *overlapped);
long WriteFile();
long GetFileSize(int handle, unsigned int *high);
long SetFilePointer();
long SetFileTime(void *file, const void *file_time);
long FindNextFileW(long handle, void *find_data);
int GetDiskFreeSpaceExW(void *path, unsigned int flags, void *out_struct, unsigned int *out_free_lo);
long MultiByteToWideChar(unsigned int code_page, unsigned int flags, const char *source, int source_count, char *destination, int capacity);
long WideCharToMultiByte(long code_page, long flags, const char *source, long source_count, char *destination, long capacity, const char *default_char, void *used_default);
long GetUserDefaultLangID(void *arg1);
long FoldStringW(void *string);
long _wcsicmp(void *a, unsigned short *b);
long CloseAllFileHandles(void *arg1);
void *CreateWindowExW(void *a, void *b, void *c, unsigned int d);
long DefWindowProcW();
long ShowWindow(void *window, long show_command);
long UpdateWindow(void *window);
int FindWindowW(void *a, void *b);
long BatteryDrvrGetLevels(void *levels);
long CeReadRecordProps(void *arg1, long arg2);
long waveOutClose(long wave_out);
long waveOutPrepareHeader(long wave_out, void *header, long header_size);
long waveOutUnprepareHeader(long wave_out, void *header, long header_size);
long waveOutWrite(long wave_out, void *header, long header_size);
long waveOutReset();
long waveOutOpen(void *wave_out, long device_id, void *format, void *callback, void *instance, long flags);
long RegCloseKey(long key);
long RegCreateKeyExW(long key, const unsigned short *sub_key, long reserved, void *class_name, long options, long access, void *security, void *result, void *disposition);
int RegOpenKeyExW(unsigned int hkey, void *subkey, unsigned int reserved, void *result);
long RegQueryValueExW(long key, const unsigned short *value_name, long reserved, void *type, void *data, void *data_size);
long RegSetValueExW(long key, const unsigned short *value_name, long reserved, long type, const void *data, long data_size);
long Sleep(unsigned int ms);
long GetLastError();
long FindResourceW(long module, long resource_id, long resource_type);
long LoadResource(long resource);
long GetTickCount();
long CloseHandle(int handle);
long GetDlgItemTextW(long dialog, long item_id, void *text, long max_count);
long DialogBoxIndirectParamW();
long EndDialog(long dialog, long result);
long SetForegroundWindow(long window);
long ce_sprintf(char *buffer, const char *format, ...);
long MessageBoxW(const void *text, const void *caption);
long DispatchMessageW(const void *message);
int PeekMessageW(void *msg, void *hwndFilter, unsigned int wMsgFilterMin, unsigned int wMsgFilterMax, unsigned int wRemoveMsg);
long PostQuitMessage(long exit_code);
int PostMessageW(void *hwnd, unsigned int msg, unsigned int wparam, int lparam);
long TranslateMessage(const void *message);
long GetSystemMetrics(long index);
long DeleteObject(long object);
long GetStockObject(long object_id);
int ce_atoi(const char *text);
long ordfloat_cos(unsigned long long x);
void LocalFree(void *ptr);
char *_itoa(long value, char *buffer, long radix);
long ordfloat_log(long lo, long hi);
char *_ltoa(long value, char *buffer, long radix);
void *ce_malloc(unsigned int size);
void *ce_memmove(void *dest, void *src, unsigned int n);
void *ce_memset(void *ptr, int val, unsigned int n);
long ce_rand();
void *ce_realloc(void *ptr, unsigned int size);
long ordfloat_sin(unsigned int lo, unsigned int hi);
long ce_srand(long seed);
char *ce_strcat(char *dest, char *src);
char *ce_strchr(const char *s, int c);
int ce_strcmp(const char *a, const char *b);
unsigned int ce_strlen(const char *s);
int ce_strncmp(const char *a, const char *b, unsigned int n);
long ce_strncpy(char *dest, const char *src, unsigned int n);
char *ce_strstr(const char *haystack, const char *needle);
long ce_tolower(long ch);
long ce_toupper(long ch);
long cpp_operator_delete(void *block);
void *cpp_operator_new(long byte_count);
void NKDbgPrintfW(const char *fmt, ...);
void *ce_fopen(void *path, void *mode);
int ce_fscanf(void *f, const char *fmt, ...);
int ce_fclose(void *f);
void *ce_calloc(unsigned int elem_size, unsigned int count);
char *ce_strrchr(char *str, int c);
char *_strlwr(char *text);
char *_strupr(char *str);
long _isctype(int c, int mask);
divmod_result ordint_divmod(int divisor, int dividend);
divmod_result orduint_divmod(unsigned int divisor, unsigned int dividend);
long ordfloat_sub(unsigned int a, unsigned int b);
long ordfloat_double_binop(long a_lo, long a_hi, long b_lo, long b_hi);
long ordfloat_int_to_float(unsigned int x);
long ordfloat_uint_to_float(unsigned int x);
long ordfloat_float_to_double(unsigned long long x);
long ordfloat_negate(unsigned int x);
long ordfloat_mul(unsigned int a, unsigned int b);
long ordfloat_double_mul2(unsigned int alo, unsigned int ahi, unsigned int blo, unsigned int bhi);
long ordfloat_lt(unsigned int a, unsigned int b);
long ordfloat_le(unsigned int a, unsigned int b);
long ordfloat_int_to_float2(int x);
long ordfloat_double_from_int(long value);
long ordfloat_gt(unsigned int a, unsigned int b);
long ordfloat_ge(unsigned int a, unsigned int b);
long ordfloat_double_to_float(unsigned long long x);
long ordfloat_double_result();
long ordfloat_div(unsigned int a, unsigned int b);
long ordfloat_double_binop2(long a_lo, long a_hi, long b_lo, long b_hi);
long ordfloat_add(unsigned int a, unsigned int b);
long ordfloat_double_op3(long a_lo, long a_hi, long b_lo, long b_hi);
long ordaudio_op_2063(void *arg1, const void *arg2, long arg3, long arg4);
long ordaudio_op_2135(void *archive, const void *buffer, long byte_count, ...);
long ordaudio_op_2142(void *archive);
long ordaudio_op_2304(void *arg1, void *arg2, long arg3);
long ordaudio_op_2413(void *arg1, long arg2, long arg3);
long ordaudio_op_2582();
long ordaudio_op_2588(void *archive, long value);

#endif
