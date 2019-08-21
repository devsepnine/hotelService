package com.pick.hotels.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.springframework.stereotype.Service;

@Service
public class RandomStringService {
	
	public String generate(int length) {
		List<String> list = new ArrayList<>();
		for(char i='a'; i<='z'; i++) list.add(String.valueOf(i));
		for(char i='A'; i<='Z'; i++) list.add(String.valueOf(i));
		for(char i='0'; i<='9'; i++) list.add(String.valueOf(i));
		
		StringBuffer buffer = new StringBuffer();
		Random r = new Random();
		for(int i=0; i < length; i++) {
			int index = r.nextInt(list.size());
			buffer.append(list.get(index));
		}
		return buffer.toString();
		
	}
}
