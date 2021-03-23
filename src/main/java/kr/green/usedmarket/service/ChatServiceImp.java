package kr.green.usedmarket.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.usedmarket.dao.ChatDao;

@Service
public class ChatServiceImp implements ChatService{
	
	@Autowired
	ChatDao chatDao;

}
