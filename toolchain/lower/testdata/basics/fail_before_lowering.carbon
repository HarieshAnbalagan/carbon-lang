// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// This validates that earlier errors prevent lowering, without crashing.
// AUTOUPDATE
// TIP: To test this file alone, run:
// TIP:   bazel test //toolchain/testing:file_test --test_arg=--file_tests=toolchain/lower/testdata/basics/fail_before_lowering.carbon
// TIP: To dump output, run:
// TIP:   bazel run //toolchain/testing:file_test -- --dump_output --file_tests=toolchain/lower/testdata/basics/fail_before_lowering.carbon

// CHECK:STDERR: fail_before_lowering.carbon:[[@LINE+7]]:1: ERROR: Unrecognized declaration introducer.
// CHECK:STDERR: a;
// CHECK:STDERR: ^
// CHECK:STDERR:
// CHECK:STDERR: fail_before_lowering.carbon:[[@LINE+3]]:1: ERROR: Semantics TODO: `HandleInvalidParseStart`.
// CHECK:STDERR: a;
// CHECK:STDERR: ^
a;
