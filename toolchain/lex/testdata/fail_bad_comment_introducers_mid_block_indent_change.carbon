// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// We only diagnose a bad comment introducer on the first line of a block of
// comments, but we only consider comments with identical indent to be a block.
// This file tests that specific behavior.

//abc
//abc
//abc
  //abc
  //abc
  //abc
//abc
//abc
//abc

// We move the auto-update marker to the end to ensure that the added CHECKs
// don't interrupt the specific block structures above.
// AUTOUPDATE
// TIP: To test this file alone, run:
// TIP:   bazel test //toolchain/testing:file_test --test_arg=--file_tests=toolchain/lex/testdata/fail_bad_comment_introducers_mid_block_indent_change.carbon
// TIP: To dump output, run:
// TIP:   bazel run //toolchain/testing:file_test -- --dump_output --file_tests=toolchain/lex/testdata/fail_bad_comment_introducers_mid_block_indent_change.carbon
// CHECK:STDERR: fail_bad_comment_introducers_mid_block_indent_change.carbon:[[@LINE-17]]:3: ERROR: Whitespace is required after '//'.
// CHECK:STDERR: //abc
// CHECK:STDERR:   ^
// CHECK:STDERR:
// CHECK:STDERR: fail_bad_comment_introducers_mid_block_indent_change.carbon:[[@LINE-18]]:5: ERROR: Whitespace is required after '//'.
// CHECK:STDERR:   //abc
// CHECK:STDERR:     ^
// CHECK:STDERR:
// CHECK:STDERR: fail_bad_comment_introducers_mid_block_indent_change.carbon:[[@LINE-19]]:3: ERROR: Whitespace is required after '//'.
// CHECK:STDERR: //abc
// CHECK:STDERR:   ^
// CHECK:STDOUT: - filename: fail_bad_comment_introducers_mid_block_indent_change.carbon
// CHECK:STDOUT:   tokens: [
// CHECK:STDOUT:     { index: 0, kind: 'FileStart', line: {{ *\d+}}, column:  1, indent: 1, spelling: '', has_trailing_space: true },

// CHECK:STDOUT:     { index: 1, kind:   'FileEnd', line: {{ *}}[[@LINE+1]], column: {{ *\d+}}, indent: 1, spelling: '' },
// CHECK:STDOUT:   ]
