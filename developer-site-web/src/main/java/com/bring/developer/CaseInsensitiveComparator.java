package com.bring.developer;

import java.util.Comparator;

import org.springframework.stereotype.Service;

@Service
public class CaseInsensitiveComparator implements Comparator<String> {

    @Override
    public int compare(String o1, String o2) {
        return String.CASE_INSENSITIVE_ORDER.compare(o1, o2);
    }
}