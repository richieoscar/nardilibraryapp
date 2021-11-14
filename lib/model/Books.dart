class Book {
  String title;
  String coverImage;
  String author;

  Book(this.title, this.coverImage, this.author);

  static List<Book> getbooks() {
     List<Book>books = [Book("Rivals", 'assets/book1.png', 'Oscar Anyiam'),
      Book("Make Love", 'assets/book2.png', 'James Brown'),
      Book("Money Matters", 'assets/book3.png', 'Duke Raulen'),
      Book("Sell Like Crazy", 'assets/book4.png', 'Jeje Noje')];
    return books;
  }
}
