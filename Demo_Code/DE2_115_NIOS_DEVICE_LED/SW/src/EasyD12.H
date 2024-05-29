
extern "C"
{
  DWORD __stdcall ReadPort1 (BYTE* pData, size_t iLen);
  DWORD __stdcall ReadPort2 (BYTE* pData, size_t iLen);
  DWORD __stdcall WritePort1 (BYTE* pData, size_t iLen);
  DWORD __stdcall WritePort2 (BYTE* pData, size_t iLen);
}