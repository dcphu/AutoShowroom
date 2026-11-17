package data.dao;

import model.BookingRequest;
import model.ContactMessage;
import java.util.List;

/**
 * Interface BookingDao quản lý đăng ký lái thử và tin nhắn tư vấn khách hàng
 * @author Phu
 */
public interface BookingDao {

    public BookingRequest addBooking(String fullName, String phone, String email, int carId,
                                     String carName, String bookingDate, String bookingTime,
                                     String locationType, String notes);

    public List<BookingRequest> findAllBookings();

    public BookingRequest findBooking(int id);

    public boolean updateBookingStatus(int id, String newStatus);

    public ContactMessage addContact(String fullName, String phone, String email,
                                     String subject, String message);

    public List<ContactMessage> findAllContacts();

    public ContactMessage findContact(int id);

    public boolean replyContact(int id, String replyMessage, String repliedBy);
}
