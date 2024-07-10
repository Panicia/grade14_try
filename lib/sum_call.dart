import 'package:grade14_try/sum_bindings.dart';
import 'dart:ffi' as ffi;

/// Для генерации .so: gcc -shared -o libhello.so -fPIC hello.c
/// Для генерации bindings:
/// в pubspec.yaml:
/// ```yaml
/// ffigen:
///   name: SumLibrary
///   description: Bindings to `sum_ffi/sum.h`.
///   output: 'lib/sum_bindings.dart'
///   headers:
///     entry-points:
///      - 'lib/sum_ffi/sum.h'
/// ```
/// В консоль: dart run ffigen
int callSumFromC(int a, int b) {
  final lib = SumLibrary(ffi.DynamicLibrary.open('sum_ffi/libsum.so'));
  return lib.sum(a, b);
}