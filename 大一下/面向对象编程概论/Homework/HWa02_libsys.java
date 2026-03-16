import java.util.ArrayList;
import java.util.Scanner;
public class libsys_
{
// Book class
class Book {
    private String bookID;
    private String title;
    private String author;
    private boolean isBorrowed;

    public Book(String bookID, String title, String author) {
        this.bookID = bookID;
        this.title = title;
        this.author = author;
        this.isBorrowed = false;
    }

    // Getters and Setters
    public String getBookID() {
        return bookID;
    }

    public String getTitle() {
        return title;
    }

    public String getAuthor() {
        return author;
    }

    public boolean isBorrowed() {
        return isBorrowed;
    }

    public void borrowBook() {
        if (!isBorrowed) {
            isBorrowed = true;
        }
    }

    public void returnBook() {
        if (isBorrowed) {
            isBorrowed = false;
        }
    }
}

// Member class
class Member {
    private String memberID;
    private String name;
    private ArrayList<Book> borrowedBooks;

    public Member(String memberID, String name) {
        this.memberID = memberID;
        this.name = name;
        this.borrowedBooks = new ArrayList<>();
    }

    // Getters and Setters
    public String getMemberID() {
        return memberID;
    }

    public String getName() {
        return name;
    }

    public void borrowBook(Book book) {
        if (!book.isBorrowed()) {
            borrowedBooks.add(book);
            book.borrowBook();
        }
    }

    public void returnBook(Book book) {
        if (borrowedBooks.contains(book)) {
            borrowedBooks.remove(book);
            book.returnBook();
        }
    }
}

// Librarian class
class Librarian extends Member {
    public Librarian(String memberID, String name) {
        super(memberID, name);
    }

    public void addBook(Library library, Book book) {
        library.addBook(book);
    }

    public void removeBook(Library library, Book book) {
        library.removeBook(book);
    }

    public void listAvailableBooks(Library library) {
        library.listAvailableBooks();
    }

    public void listBorrowedBooks(Library library) {
        library.listBorrowedBooks();
    }
}

// Library class
class Library {
    private ArrayList<Book> books;
    private ArrayList<Member> members;

    public Library() {
        this.books = new ArrayList<>();
        this.members = new ArrayList<>();
    }

    public void addMember(Member member) {
        members.add(member);
    }

    public void removeMember(Member member) {
        members.remove(member);
    }

    public Book findBookByID(String bookID) {
        for (Book book : books) {
            if (book.getBookID().equals(bookID)) {
                return book;
            }
        }
        return null;
    }

    public Member findMemberByID(String memberID) {
        for (Member member : members) {
            if (member.getMemberID().equals(memberID)) {
                return member;
            }
        }
        return null;
    }

    public void addBook(Book book) {
        books.add(book);
    }

    public void removeBook(Book book) {
        books.remove(book);
    }

    public void listAllBooks() {
        for (Book book : books) {
            System.out.println("Book ID: " + book.getBookID() + ", Title: " + book.getTitle() + ", Author: " + book.getAuthor());
        }
    }

    public void listAllMembers() {
        for (Member member : members) {
            System.out.println("Member ID: " + member.getMemberID() + ", Name: " + member.getName());
        }
    }

    public void listAvailableBooks() {
        for (Book book : books) {
            if (!book.isBorrowed()) {
                System.out.println("Book ID: " + book.getBookID() + ", Title: " + book.getTitle() + ", Author: " + book.getAuthor());
            }
        }
    }

    public void listBorrowedBooks() {
        for (Book book : books) {
            if (book.isBorrowed()) {
                System.out.println("Book ID: " + book.getBookID() + ", Title: " + book.getTitle() + ", Author: " + book.getAuthor());
            }
        }
    }
}
}
