// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// NOAUTOUPDATE

package ExplorerTest api;

// CHECK:STDERR: COMPILATION ERROR: fail_combine_lhs.carbon:[[@LINE+1]]: expected a constraint in first operand of `&`, found i32
fn F[T:! i32 & type]();

fn Main() -> i32 {
  return 0;
}
