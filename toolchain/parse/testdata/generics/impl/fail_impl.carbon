// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// AUTOUPDATE
// TIP: To test this file alone, run:
// TIP:   bazel test //toolchain/testing:file_test --test_arg=--file_tests=toolchain/parse/testdata/generics/impl/fail_impl.carbon
// TIP: To dump output, run:
// TIP:   bazel run //toolchain/testing:file_test -- --dump_output --file_tests=toolchain/parse/testdata/generics/impl/fail_impl.carbon

// CHECK:STDERR: fail_impl.carbon:[[@LINE+4]]:10: ERROR: Expected `as` in `impl` declaration.
// CHECK:STDERR: impl foo bar;
// CHECK:STDERR:          ^~~
// CHECK:STDERR:
impl foo bar;

// CHECK:STDERR: fail_impl.carbon:[[@LINE+4]]:12: ERROR: Expected expression.
// CHECK:STDERR: impl i32 as;
// CHECK:STDERR:            ^
// CHECK:STDERR:
impl i32 as;

// CHECK:STDERR: fail_impl.carbon:[[@LINE+4]]:18: ERROR: `impl` declarations must either end with a `;` or have a `{ ... }` block for a definition.
// CHECK:STDERR: impl bool as bar unexpected;
// CHECK:STDERR:                  ^~~~~~~~~~
// CHECK:STDERR:
impl bool as bar unexpected;

// CHECK:STDERR: fail_impl.carbon:[[@LINE+4]]:6: ERROR: Expected expression.
// CHECK:STDERR: impl return as A;
// CHECK:STDERR:      ^~~~~~
// CHECK:STDERR:
impl return as A;

// CHECK:STDERR: fail_impl.carbon:[[@LINE+4]]:6: ERROR: Expected expression.
// CHECK:STDERR: impl return B;
// CHECK:STDERR:      ^~~~~~
// CHECK:STDERR:
impl return B;

// CHECK:STDERR: fail_impl.carbon:[[@LINE+8]]:13: ERROR: Expected `[` after `forall` in `impl` declaration.
// CHECK:STDERR: impl forall f32;
// CHECK:STDERR:             ^~~
// CHECK:STDERR:
// CHECK:STDERR: fail_impl.carbon:[[@LINE+4]]:16: ERROR: Expected `as` in `impl` declaration.
// CHECK:STDERR: impl forall f32;
// CHECK:STDERR:                ^
// CHECK:STDERR:
impl forall f32;

// CHECK:STDERR: fail_impl.carbon:[[@LINE+4]]:19: ERROR: Expected `as` in `impl` declaration.
// CHECK:STDERR: impl forall [] u32;
// CHECK:STDERR:                   ^
// CHECK:STDERR:
impl forall [] u32;

// CHECK:STDERR: fail_impl.carbon:[[@LINE+8]]:21: ERROR: Expected binding pattern.
// CHECK:STDERR: impl forall [invalid] i8;
// CHECK:STDERR:                     ^
// CHECK:STDERR:
// CHECK:STDERR: fail_impl.carbon:[[@LINE+4]]:25: ERROR: Expected `as` in `impl` declaration.
// CHECK:STDERR: impl forall [invalid] i8;
// CHECK:STDERR:                         ^
// CHECK:STDERR:
impl forall [invalid] i8;

// CHECK:STDERR: fail_impl.carbon:[[@LINE+4]]:13: ERROR: Expected `[` after `forall` in `impl` declaration.
// CHECK:STDERR: impl forall f16 as Quux;
// CHECK:STDERR:             ^~~
// CHECK:STDERR:
impl forall f16 as Quux;

// CHECK:STDERR: fail_impl.carbon:[[@LINE+4]]:30: ERROR: Expected `as` in `impl` declaration.
// CHECK:STDERR: impl forall [T:! type] String;
// CHECK:STDERR:                              ^
// CHECK:STDERR:
impl forall [T:! type] String;

// CHECK:STDERR: fail_impl.carbon:[[@LINE+4]]:26: ERROR: Expected `as` in `impl` declaration.
// CHECK:STDERR: impl forall [T:! type] T missing_as;
// CHECK:STDERR:                          ^~~~~~~~~~
// CHECK:STDERR:
impl forall [T:! type] T missing_as;

// CHECK:STDERR: fail_impl.carbon:[[@LINE+4]]:39: ERROR: `impl` declarations must either end with a `;` or have a `{ ... }` block for a definition.
// CHECK:STDERR: impl forall [T:! type] T as Interface extra;
// CHECK:STDERR:                                       ^~~~~
// CHECK:STDERR:
impl forall [T:! type] T as Interface extra;

// CHECK:STDERR: fail_impl.carbon:[[@LINE+4]]:5: ERROR: Expected expression.
// CHECK:STDERR: impl;
// CHECK:STDERR:     ^
// CHECK:STDERR:
impl;

impl

// CHECK:STDERR: fail_impl.carbon:[[@LINE+88]]:21: ERROR: Expected expression.
// CHECK:STDERR: // CHECK:STDOUT:   ]
// CHECK:STDERR:                     ^
// CHECK:STDOUT: - filename: fail_impl.carbon
// CHECK:STDOUT:   parse_tree: [
// CHECK:STDOUT:     {kind: 'FileStart', text: ''},
// CHECK:STDOUT:       {kind: 'ImplIntroducer', text: 'impl'},
// CHECK:STDOUT:       {kind: 'IdentifierNameExpr', text: 'foo'},
// CHECK:STDOUT:     {kind: 'ImplDecl', text: ';', has_error: yes, subtree_size: 3},
// CHECK:STDOUT:       {kind: 'ImplIntroducer', text: 'impl'},
// CHECK:STDOUT:         {kind: 'IntTypeLiteral', text: 'i32'},
// CHECK:STDOUT:       {kind: 'TypeImplAs', text: 'as', subtree_size: 2},
// CHECK:STDOUT:       {kind: 'InvalidParse', text: ';', has_error: yes},
// CHECK:STDOUT:     {kind: 'ImplDecl', text: ';', has_error: yes, subtree_size: 5},
// CHECK:STDOUT:       {kind: 'ImplIntroducer', text: 'impl'},
// CHECK:STDOUT:         {kind: 'BoolTypeLiteral', text: 'bool'},
// CHECK:STDOUT:       {kind: 'TypeImplAs', text: 'as', subtree_size: 2},
// CHECK:STDOUT:       {kind: 'IdentifierNameExpr', text: 'bar'},
// CHECK:STDOUT:     {kind: 'ImplDecl', text: ';', has_error: yes, subtree_size: 5},
// CHECK:STDOUT:       {kind: 'ImplIntroducer', text: 'impl'},
// CHECK:STDOUT:       {kind: 'InvalidParse', text: 'return', has_error: yes},
// CHECK:STDOUT:     {kind: 'ImplDecl', text: ';', has_error: yes, subtree_size: 3},
// CHECK:STDOUT:       {kind: 'ImplIntroducer', text: 'impl'},
// CHECK:STDOUT:       {kind: 'InvalidParse', text: 'return', has_error: yes},
// CHECK:STDOUT:     {kind: 'ImplDecl', text: ';', has_error: yes, subtree_size: 3},
// CHECK:STDOUT:       {kind: 'ImplIntroducer', text: 'impl'},
// CHECK:STDOUT:         {kind: 'InvalidParse', text: 'f32', has_error: yes},
// CHECK:STDOUT:       {kind: 'ImplForall', text: 'forall', has_error: yes, subtree_size: 2},
// CHECK:STDOUT:       {kind: 'FloatTypeLiteral', text: 'f32'},
// CHECK:STDOUT:     {kind: 'ImplDecl', text: ';', has_error: yes, subtree_size: 5},
// CHECK:STDOUT:       {kind: 'ImplIntroducer', text: 'impl'},
// CHECK:STDOUT:           {kind: 'ImplicitParamListStart', text: '['},
// CHECK:STDOUT:         {kind: 'ImplicitParamList', text: ']', subtree_size: 2},
// CHECK:STDOUT:       {kind: 'ImplForall', text: 'forall', subtree_size: 3},
// CHECK:STDOUT:       {kind: 'UnsignedIntTypeLiteral', text: 'u32'},
// CHECK:STDOUT:     {kind: 'ImplDecl', text: ';', has_error: yes, subtree_size: 6},
// CHECK:STDOUT:       {kind: 'ImplIntroducer', text: 'impl'},
// CHECK:STDOUT:           {kind: 'ImplicitParamListStart', text: '['},
// CHECK:STDOUT:             {kind: 'IdentifierName', text: 'invalid'},
// CHECK:STDOUT:             {kind: 'InvalidParse', text: ']', has_error: yes},
// CHECK:STDOUT:           {kind: 'BindingPattern', text: 'invalid', has_error: yes, subtree_size: 3},
// CHECK:STDOUT:         {kind: 'ImplicitParamList', text: ']', has_error: yes, subtree_size: 5},
// CHECK:STDOUT:       {kind: 'ImplForall', text: 'forall', subtree_size: 6},
// CHECK:STDOUT:       {kind: 'IntTypeLiteral', text: 'i8'},
// CHECK:STDOUT:     {kind: 'ImplDecl', text: ';', has_error: yes, subtree_size: 9},
// CHECK:STDOUT:       {kind: 'ImplIntroducer', text: 'impl'},
// CHECK:STDOUT:         {kind: 'InvalidParse', text: 'f16', has_error: yes},
// CHECK:STDOUT:       {kind: 'ImplForall', text: 'forall', has_error: yes, subtree_size: 2},
// CHECK:STDOUT:         {kind: 'FloatTypeLiteral', text: 'f16'},
// CHECK:STDOUT:       {kind: 'TypeImplAs', text: 'as', subtree_size: 2},
// CHECK:STDOUT:       {kind: 'IdentifierNameExpr', text: 'Quux'},
// CHECK:STDOUT:     {kind: 'ImplDecl', text: ';', has_error: yes, subtree_size: 7},
// CHECK:STDOUT:       {kind: 'ImplIntroducer', text: 'impl'},
// CHECK:STDOUT:           {kind: 'ImplicitParamListStart', text: '['},
// CHECK:STDOUT:             {kind: 'IdentifierName', text: 'T'},
// CHECK:STDOUT:             {kind: 'TypeTypeLiteral', text: 'type'},
// CHECK:STDOUT:           {kind: 'CompileTimeBindingPattern', text: ':!', subtree_size: 3},
// CHECK:STDOUT:         {kind: 'ImplicitParamList', text: ']', subtree_size: 5},
// CHECK:STDOUT:       {kind: 'ImplForall', text: 'forall', subtree_size: 6},
// CHECK:STDOUT:       {kind: 'StringTypeLiteral', text: 'String'},
// CHECK:STDOUT:     {kind: 'ImplDecl', text: ';', has_error: yes, subtree_size: 9},
// CHECK:STDOUT:       {kind: 'ImplIntroducer', text: 'impl'},
// CHECK:STDOUT:           {kind: 'ImplicitParamListStart', text: '['},
// CHECK:STDOUT:             {kind: 'IdentifierName', text: 'T'},
// CHECK:STDOUT:             {kind: 'TypeTypeLiteral', text: 'type'},
// CHECK:STDOUT:           {kind: 'CompileTimeBindingPattern', text: ':!', subtree_size: 3},
// CHECK:STDOUT:         {kind: 'ImplicitParamList', text: ']', subtree_size: 5},
// CHECK:STDOUT:       {kind: 'ImplForall', text: 'forall', subtree_size: 6},
// CHECK:STDOUT:       {kind: 'IdentifierNameExpr', text: 'T'},
// CHECK:STDOUT:     {kind: 'ImplDecl', text: ';', has_error: yes, subtree_size: 9},
// CHECK:STDOUT:       {kind: 'ImplIntroducer', text: 'impl'},
// CHECK:STDOUT:           {kind: 'ImplicitParamListStart', text: '['},
// CHECK:STDOUT:             {kind: 'IdentifierName', text: 'T'},
// CHECK:STDOUT:             {kind: 'TypeTypeLiteral', text: 'type'},
// CHECK:STDOUT:           {kind: 'CompileTimeBindingPattern', text: ':!', subtree_size: 3},
// CHECK:STDOUT:         {kind: 'ImplicitParamList', text: ']', subtree_size: 5},
// CHECK:STDOUT:       {kind: 'ImplForall', text: 'forall', subtree_size: 6},
// CHECK:STDOUT:         {kind: 'IdentifierNameExpr', text: 'T'},
// CHECK:STDOUT:       {kind: 'TypeImplAs', text: 'as', subtree_size: 2},
// CHECK:STDOUT:       {kind: 'IdentifierNameExpr', text: 'Interface'},
// CHECK:STDOUT:     {kind: 'ImplDecl', text: ';', has_error: yes, subtree_size: 11},
// CHECK:STDOUT:       {kind: 'ImplIntroducer', text: 'impl'},
// CHECK:STDOUT:       {kind: 'InvalidParse', text: ';', has_error: yes},
// CHECK:STDOUT:     {kind: 'ImplDecl', text: ';', has_error: yes, subtree_size: 3},
// CHECK:STDOUT:       {kind: 'ImplIntroducer', text: 'impl'},
// CHECK:STDOUT:       {kind: 'InvalidParse', text: '', has_error: yes},
// CHECK:STDOUT:     {kind: 'ImplDecl', text: 'impl', has_error: yes, subtree_size: 3},
// CHECK:STDOUT:     {kind: 'FileEnd', text: ''},
// CHECK:STDOUT:   ]
