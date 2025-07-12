package com.example.newchat.Utils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class Loggers {

public static Logger getLogger(Class<?> clazz) {
        return LoggerFactory.getLogger(clazz);
    }
}
