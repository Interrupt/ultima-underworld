/* Product registration/copy-protection cluster: the code-wheel registration-word checksum
   (validate_codewheel_word and its two table- lookup helpers), the registry-based "already
   validated" sentinel (check_registration_key_saved/save_registration_key_validated)... */
#include "headers/registration.h"
#include "headers/debug.h"
#include <stdio.h>
#include <stdlib.h>

/* Read as a pointer (codewheel_letter_at_index/codewheel_index_of_letter both dereference it as
   `short *`), same truncated-pointer-in-an-int bug class as this project's other DAT_xxx symbols,
   but never assigned anywhere in the whole decompile... */
static short *DAT_00086f0c;
static unsigned short u_BuildNo_00086f5c[] = u"BuildNo";
static unsigned short u_Software_ZIO_Interactive_Ultima_U_00086f6c[] = u"Software\\ZIO_Interactive_Ultima_U";
static int DAT_0023c108;
/* Sizing-audit pass: `GetDlgItemTextW(param_1,0x3e9,&DAT_0023bf78,
   0xb4)` -- the W (wide-char) API, so 0xb4 (180) counts WCHAR units,
   not bytes: real need 360 bytes. HARD exact. Down from 8192. */
static undefined DAT_0023bf78_backing[360];
#define DAT_0023bf78 DAT_0023bf78_backing[0]





// was FUN_0006b3dc -- codewheel character-table lookup: returns the short value at index param_1
// (0..0x23/35) of the table DAT_00086f0c points at, or 0 if out of range.
short codewheel_letter_at_index(int index)
{
  if ((index < 0) || (0x23 < index)) {
    return 0;
  }
  return DAT_00086f0c[index];
}



// was FUN_0006b408 -- reverse lookup into the same codewheel character
// table as codewheel_letter_at_index: returns the index of the first
// entry equal to param_1, or -1 if not found. Same dead-code status.
int codewheel_index_of_letter(short letter)
{
  int index = 0;
  short *table_entry = DAT_00086f0c;

  do {
    if (*table_entry == letter) {
      return index;
    }
    index = index + 1;
    table_entry = table_entry + 1;
  } while (index < 0x24);
  return -1;
}



// was FUN_0006b448 -- the code-wheel registration-word checksum: param_2 is a 12-char answer word
// (uppercased in-place into local_48), param_1 a 4-entry ushort key.
int validate_codewheel_word(ushort *key, ushort *answer_address)
{
  int uw_ord2005_rem_128 = 0; int uw_ord2005_rem_129 = 0; int uw_ord2005_rem_130 = 0; int uw_ord2005_rem_131 = 0; int uw_ord2005_rem_132 = 0; int uw_ord2005_rem_133 = 0;
  short expected_letter;
  int next_index;
  int letter_index_0;
  int letter_index_3;
  int letter_index_6;
  int letter_index_9;
  int letter_index_1;
  int letter_index_4;
  int letter_index_7;
  int letter_index_10;
  ushort character;
  int i;
  ushort answer[14];

  /* Uppercase the 12-character answer into answer[]. */
  i = 0;
  do {
    character = answer_address[i];
    if ((character < 0x7b) && (0x60 < character)) {
      character = character - 0x20;
    }
    next_index = (i + 1) * 0x10000;
    answer[i] = character;
    i = next_index >> 0x10;
  } while (i < 0xc);
  answer[(short)((uint)next_index >> 0x10)] = 0;
  letter_index_0 = codewheel_index_of_letter(answer[0]);
  letter_index_3 = codewheel_index_of_letter(answer[3]);
  letter_index_6 = codewheel_index_of_letter(answer[6]);
  letter_index_9 = codewheel_index_of_letter(answer[9]);
  letter_index_1 = codewheel_index_of_letter(answer[1]);
  letter_index_4 = codewheel_index_of_letter(answer[4]);
  letter_index_7 = codewheel_index_of_letter(answer[7]);
  letter_index_10 = codewheel_index_of_letter(answer[10]);
  uw_ord2005_rem_128 = ((int)(letter_index_9 + letter_index_6 + letter_index_3 + letter_index_0)) % (0x24);
  uw_ord2005_rem_129 = ((int)(letter_index_10 + letter_index_7 + letter_index_4 + letter_index_1)) % (0x24);
  uw_ord2005_rem_130 = ((int)(letter_index_9 * letter_index_6 * letter_index_3 * letter_index_0)) % (0x24);
  uw_ord2005_rem_131 = ((int)(letter_index_10 * letter_index_7 * letter_index_4 * letter_index_1)) % (0x24);
  expected_letter = codewheel_letter_at_index(uw_ord2005_rem_128);
  if ((expected_letter == answer[2]) && (expected_letter = codewheel_letter_at_index(uw_ord2005_rem_129), expected_letter == answer[5])) {
    uw_ord2005_rem_132 = ((int)(((uint)*key + (uint)key[1]) * uw_ord2005_rem_130)) % (0x24);
    uw_ord2005_rem_133 = ((int)(((uint)key[2] + (uint)key[3]) * uw_ord2005_rem_131)) % (0x24);
    expected_letter = codewheel_letter_at_index(uw_ord2005_rem_132);
    if (((expected_letter == answer[8]) && (expected_letter = codewheel_letter_at_index(uw_ord2005_rem_133), expected_letter == answer[0xb]))
       && (((((letter_index_0 != 0 || (letter_index_3 != 0)) || (letter_index_6 != 0)) ||
            ((((letter_index_9 != 0 || (letter_index_1 != 0)) || (letter_index_4 != 0)) || ((letter_index_7 != 0 || (letter_index_10 != 0)))))) ||
           ((uw_ord2005_rem_130 != 0 ||
            ((((uw_ord2005_rem_131 != 0 || (uw_ord2005_rem_128 != 0)) || (uw_ord2005_rem_129 != 0)) ||
             ((uw_ord2005_rem_132 != 0 || (uw_ord2005_rem_133 != 0)))))))))) {
      return 1;
    }
  }
  return 0;
}



// was FUN_0006b718 -- checks the registry (HKLM\Software\ZIO_Interactive_ Ultima_U\BuildNo) for the
// sentinel value 0xc0f this port's registration flow writes via save_registration_key_validated
// once the product's been validated...
int check_registration_key_saved()
{
  int query_result;
  undefined4 random_value;
  undefined4 is_registered = 0;
  int build_number;
  undefined4 registry_key;
  undefined4 value_size = 4;
  undefined4 value_type = 4;
  undefined1 disposition[4];

  RegCreateKeyExW(0x80000001,u_Software_ZIO_Interactive_Ultima_U_00086f6c,0,0,0,0,0,&registry_key,disposition)
  ;
  query_result = RegQueryValueExW(registry_key,u_BuildNo_00086f5c,0,&value_type,&build_number,&value_size);
  if (query_result == 0) {
    RegQueryValueExW(registry_key,u_BuildNo_00086f5c,0,&value_type,&build_number,&value_size);
    if (build_number == 0xc0f) {
      is_registered = 1;
    }
  }
  else {
    random_value = Random();
    build_number = orduint_divmod(10000,random_value).rem + 1;
    RegSetValueExW(registry_key,u_BuildNo_00086f5c,0,value_type,&build_number,value_size);
  }
  RegCloseKey(registry_key);
  return is_registered;
}



// was FUN_0006b838 -- writes the registry sentinel (0xc0f) check_registration_key_saved
// looks for, marking the product as validated/registered.
void save_registration_key_validated()
{
  undefined4 registry_key;
  undefined4 validated_sentinel;
  undefined1 disposition[4];

  RegCreateKeyExW(0x80000001,u_Software_ZIO_Interactive_Ultima_U_00086f6c,0,0,0,0,0,&registry_key,disposition)
  ;
  validated_sentinel = 0xc0f;
  RegSetValueExW(registry_key,u_BuildNo_00086f5c,0,4,&validated_sentinel,4);
  RegCloseKey(registry_key);
}



// was FUN_0006b8c0
void set_power_status_flag_bit()
{
  /* Looks like a GetSystemPowerStatus/GetVersionEx-shaped call: a struct starting with a 4-byte
     "cbSize" field is zeroed, sized, and passed to EnterCriticalSection (unidentified coredll
     query, currently a no-op stub that always reports "unsupported"/0)... */
  int query_result;
  undefined1 status_struct[0x30];

  ce_memset(status_struct,0,0x30);
  *(undefined4 *)status_struct = 0x30;
  query_result = EnterCriticalSection(0xe1,0,status_struct,0);
  if (query_result != 0) {
    *(uint *)(status_struct + 4) = *(uint *)(status_struct + 4) | 1;
    EnterCriticalSection(0xe0,0,status_struct,0);
  }
}



// was FUN_0006b920
void clear_power_status_flag_bit()
{
  /* Counterpart of set_power_status_flag_bit (see comment there): same struct shape,
     clears instead of sets the flag bit. Also dead under the current
     EnterCriticalSection stub. */
  int query_result;
  undefined1 status_struct[0x30];

  ce_memset(status_struct,0,0x30);
  *(undefined4 *)status_struct = 0x30;
  query_result = EnterCriticalSection(0xe1,0,status_struct,0);
  if (query_result != 0) {
    *(uint *)(status_struct + 4) = *(uint *)(status_struct + 4) & 0xfffffffe;
    EnterCriticalSection(0xe0,0,status_struct,0);
  }
}



// was FUN_0006b980
int check_registration_key_dialog(void *window, int instance)
{
  /* This is the "enter your registration key" modal dialog gate (see the "Invalid Registration Key
     Code!!" string and the registration_key_dialog_proc dialog proc it registers via
     DialogBoxIndirectParamW, a CreateDialogParam-shaped call). */
  (void)window; (void)instance;
  fprintf(stderr, "[stub] check_registration_key_dialog: bypassing registration-key dialog, "
                  "treating as already registered\n");
  return 1;
}



// was FUN_0006ba54 -- window proc for the (never actually shown, see check_registration_key_dialog)
// "enter your registration key" dialog: WM_INITDIALOG-shaped (0x110)... but that message id is
// never checked here...
int registration_key_dialog_proc(int dialog, int message, short control_id)
{
  if (message != 0x110) {
    if (message != 0x111) {
      return 0;
    }
    if ((control_id == 1) || (control_id == 2)) {
      EndDialog(dialog,control_id);  /* ARM 0x6bad8-0x6badc: r1 still holds the compared wParam (1 or 2) */
      DAT_0023c108 = 0;
    }
    else {
      if (control_id != 0x3ea) {
        return 0;
      }
      GetDlgItemTextW(dialog,0x3e9,&DAT_0023bf78,0xb4);
      EndDialog(dialog,0x3ea);
      DAT_0023c108 = 1;
    }
  }
  return 1;
}



// was FUN_0006baf8 -- top-level registration check: true if the registry sentinel is already set
// (check_registration_key_saved) or the (bypassed, always-succeeding) registration dialog gate
// (check_registration_key_dialog) reports success.
int is_product_registered(void *window, int instance)
{
  int result;
  undefined1 system_time_header[10];
  ushort system_time_seconds;
  ushort system_time_minutes;
  ushort system_time_hours;

  GetSystemTime(system_time_header);
  ce_srand((system_time_hours + 1) * (system_time_minutes + 1) * (system_time_seconds + 1));
  result = check_registration_key_saved();
  if ((result == 0) && (result = check_registration_key_dialog(window,instance), result == 0)) {
    return 0;
  }
  return 1;
}



// was FUN_0006bb64 -- startup disk-space check (its only caller checks it right after
// init_gameplay_session and shows "Not enough disk space for save game" on failure)...
int check_save_disk_space()
{
  char install_path_copy[256];
  char *path_cursor;
  char path_char;
  char *install_dir;
  int path_length;
  /* BUG FIX (unit-testing-framework merge): the converted path was held in an `undefined4`,
     truncating load_string_resource's real pointer -- same class as that function's own fix. */
  char *converted_path;
  uint free_bytes_low;
  int free_bytes_high;
  undefined1 total_bytes_buffer[7];
  char save_path_buffer[261];

  install_dir = (char *)&DAT_0023cca8;
  path_cursor = install_path_copy;
  do {
    path_char = *install_dir;
    *path_cursor = path_char;
    path_cursor = path_cursor + 1;
    install_dir = install_dir + 1;
  } while (path_char != '\0');
  ce_strcat(save_path_buffer + 1,(char *)&DAT_000857a0);
  path_length = ce_strlen(save_path_buffer + 1);
  save_path_buffer[path_length] = '\0';
  converted_path = (char *)load_string_resource(save_path_buffer + 1);
  CreateDirectoryW(converted_path,0);
  ensure_save_directory_exists(save_path_buffer + 1);
  converted_path = (char *)load_string_resource(save_path_buffer + 1);
  /* local_114 is never actually passed to GetDiskFreeSpaceExW (only auStack_110 and &local_118 are)
     -- in the original 32-bit binary this local apparently sat immediately after auStack_110 on the
     stack and got written incidentally by a GetDiskFreeSpace-shaped call writing a wider... */
  free_bytes_high = 0;
  path_length = GetDiskFreeSpaceExW(converted_path,0,total_bytes_buffer,&free_bytes_low);
  if ((path_length == 0) || ((free_bytes_high == 0 && (free_bytes_low < 0x9b0a0)))) {
    return 0;
  }
  return 1;
}

