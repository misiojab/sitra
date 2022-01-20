package com.misiojab.sitra.Utils;

@FunctionalInterface
public interface ThrowException<V, R, E extends Exception> {

    R execute(V value) throws E;

}
