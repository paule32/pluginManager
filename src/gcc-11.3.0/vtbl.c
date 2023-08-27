// ----------------------------------------------------------------------------
// File   : vtbl.c
// Author : (c) 2023 paule32 - Jens Kallup - non-profit Software
// License: all rights reserved.
// ----------------------------------------------------------------------------
# include <stdio.h>
# include <stdlib.h>
# include <strings.h>

# include <windows.h>

// ----------------------------------------------------------------------------
// An Interface is actually a Pointer to a vtable. The vtables are usally
// shared by multiple Instances, so the Methods need a different Pointer to
// be able to find the Object that the Interface is attached to.
// A COM+ Interface is binary compatible with a C++ abstract class.
// ----------------------------------------------------------------------------
typedef struct
{
    struct IFooVtbl *lpVtbl;
} IFoo;

typedef struct
{
    // IUbknown methods
    HRESULT (* QueryInterface)(IFoo *, REFIID, void **);
    ULONG   (* AddRef)        (IFoo *);
    ULONG   (* Release)       (IFoo *);
    // IFoo methods
    HRESULT (* SetValue) (IFoo *, int);
    HRESULT (* GetValue) (IFoo *, int *);
} IFooVtbl;
