// ----------------------------------------------------------------------------
// File   : vtbl.cc
// Author : (c) 2023 paule32 - Jens Kallup - non-profit Software
// License: all rights reserved.
// ----------------------------------------------------------------------------
# include <stdio.h>
# include <stdlib.h>
# include <strings.h>

# include <windows.h>
# include <objbase.h>

# undef  INTERFACE
# define INTERFACE IFoo

DECLARE_INTERFACE_ (IFoo, IUnknown)
{
    // IUnknown methods
    STDMETHOD (QueryInterface) (THIS_ REFIID, void **) PURE;
    STDMETHOD_(ULONG, AddRef)  (THIS) PURE;
    STDMETHOD_(ULONG, Release) (THIS) PURE;
    
    STDMETHOD (SetValue)       (THIS_ int) PURE;
    STDMETHOD (GetValue)       (THIS_ int *) PURE;
};

// {A46C12C0-4E88-11ce-A6F1-00AA0037DEFB}
DEFINE_GUID(IID_IFoo, 0xa46c12c0, 0x4e88, 0x11ce, 0xa6, 0xf1, 0x0, 0xaa, 0x0, 0x37, 0xde, 0xfb);
