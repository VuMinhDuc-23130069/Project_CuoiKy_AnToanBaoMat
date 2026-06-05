package vn.edu.nlu.fit.utils;

import com.google.gson.*;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 * Gson Utility Class
 * Provides a properly configured Gson instance with custom TypeAdapters
 * for Java 8+ date/time classes like LocalDateTime
 */
public class GsonUtil {
    private static final Gson gson;
    private static final DateTimeFormatter FORMATTER = DateTimeFormatter.ISO_LOCAL_DATE_TIME;

    static {
        GsonBuilder gsonBuilder = new GsonBuilder();
        
        // Register custom TypeAdapter for LocalDateTime
        gsonBuilder.registerTypeAdapter(LocalDateTime.class, new com.google.gson.TypeAdapter<LocalDateTime>() {
            @Override
            public void write(com.google.gson.stream.JsonWriter out, LocalDateTime value) throws IOException {
                if (value == null) {
                    out.nullValue();
                } else {
                    out.value(value.format(FORMATTER));
                }
            }

            @Override
            public LocalDateTime read(com.google.gson.stream.JsonReader in) throws IOException {
                if (in.peek() == com.google.gson.stream.JsonToken.NULL) {
                    in.nextNull();
                    return null;
                }
                return LocalDateTime.parse(in.nextString(), FORMATTER);
            }
        });
        
        gsonBuilder.setPrettyPrinting();
        gson = gsonBuilder.create();
    }

    /**
     * Get the configured Gson instance
     * @return Gson instance with LocalDateTime support
     */
    public static Gson getGson() {
        return gson;
    }
}


