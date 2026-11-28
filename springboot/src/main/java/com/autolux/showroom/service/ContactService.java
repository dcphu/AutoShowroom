package com.autolux.showroom.service;

import com.autolux.showroom.entity.ContactMessage;
import com.autolux.showroom.repository.ContactRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
public class ContactService {

    private final ContactRepository contactRepository;

    @Autowired
    public ContactService(ContactRepository contactRepository) {
        this.contactRepository = contactRepository;
    }

    public List<ContactMessage> findAll() {
        return contactRepository.findAllByOrderByCreatedAtDesc();
    }

    public Optional<ContactMessage> findById(Integer id) {
        return contactRepository.findById(id);
    }

    public ContactMessage createContact(String fullname, String phone, String email, String subject, String message) {
        ContactMessage contact = new ContactMessage(null, fullname, phone, email, subject, message);
        contact.setCreatedAt(LocalDateTime.now());
        contact.setStatus("Chưa phản hồi");
        return contactRepository.save(contact);
    }

    public ContactMessage reply(Integer id, String replyMessage) {
        Optional<ContactMessage> opt = contactRepository.findById(id);
        if (opt.isPresent()) {
            ContactMessage c = opt.get();
            c.setReplyMessage(replyMessage);
            c.setStatus("Đã phản hồi");
            return contactRepository.save(c);
        }
        return null;
    }

    public long count() {
        return contactRepository.count();
    }

    public long countPending() {
        return contactRepository.countByStatus("Chưa phản hồi");
    }

    public ContactMessage save(ContactMessage c) {
        return contactRepository.save(c);
    }
}
