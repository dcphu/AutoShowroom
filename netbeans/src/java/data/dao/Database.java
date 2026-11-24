package data.dao;

import data.impl.BookingImpl;
import data.impl.CarImpl;
import data.impl.CategoryImpl;

/**
 * Lớp Database Factory cung cấp các thể hiện DAO (Data Access Object)
 * @author Phu
 */
public class Database {

    private static CategoryDao categoryDao;
    private static CarDao carDao;
    private static BookingDao bookingDao;

    public static synchronized CategoryDao getCategoryDao() {
        if (categoryDao == null) {
            categoryDao = new CategoryImpl();
        }
        return categoryDao;
    }

    public static synchronized CarDao getCarDao() {
        if (carDao == null) {
            carDao = new CarImpl();
        }
        return carDao;
    }

    public static synchronized BookingDao getBookingDao() {
        if (bookingDao == null) {
            bookingDao = new BookingImpl();
        }
        return bookingDao;
    }
}

