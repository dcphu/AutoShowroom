package model;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class ContactMessage implements Serializable {
    private int id;
    private String fullName;
    private String phone;
    private String email;
    private String subject;
    private String message;
    private String createdAt;
    
    // Thuộc tính phản hồi của tư vấn viên
    private String status; // "Chưa phản hồi", "Đã phản hồi"
    private String replyMessage;
    private String repliedBy;
    private String repliedAt;

    public ContactMessage() {
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");
        this.createdAt = LocalDateTime.now().format(dtf);
        this.status = "Chưa phản hồi";
        this.replyMessage = "";
        this.repliedBy = "";
        this.repliedAt = "";
    }

    public ContactMessage(int id, String fullName, String phone, String email, String subject, String message) {
        this();
        this.id = id;
        this.fullName = fullName;
        this.phone = phone;
        this.email = email;
        this.subject = subject;
        this.message = message;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }
    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getSubject() { return subject; }
    public void setSubject(String subject) { this.subject = subject; }
    public String getMessage() { return message; }
    public void setMessage(String message) { this.message = message; }
    public String getCreatedAt() { return createdAt; }
    public void setCreatedAt(String createdAt) { this.createdAt = createdAt; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    public String getReplyMessage() { return replyMessage; }
    public void setReplyMessage(String replyMessage) { this.replyMessage = replyMessage; }
    public String getRepliedBy() { return repliedBy; }
    public void setRepliedBy(String repliedBy) { this.repliedBy = repliedBy; }
    public String getRepliedAt() { return repliedAt; }
    public void setRepliedAt(String repliedAt) { this.repliedAt = repliedAt; }
}
