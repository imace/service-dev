package com.sonymobile.sonysales.util;

@SuppressWarnings("serial")
public final class OutOfLimitedLengthException extends RuntimeException {
	/**
	 * Constructs an <code>IndexOutOfBoundsException</code> with no detail
	 * message.
	 */
	public OutOfLimitedLengthException() {
		super();
	}

	/**
	 * Constructs an <code>IndexOutOfBoundsException</code> with the specified
	 * detail message.
	 * 
	 * @param s
	 *            the detail message.
	 */
	public OutOfLimitedLengthException(String s) {
		super(s);
	}

}
