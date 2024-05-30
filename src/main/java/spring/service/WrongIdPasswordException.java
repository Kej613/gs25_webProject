package spring.service;

public class WrongIdPasswordException extends RuntimeException {
    public WrongIdPasswordException() {
        super("Wrong email or password");
    }
}