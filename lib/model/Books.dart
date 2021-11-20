class BookTest {
  String title;
  String coverImage;
  String author;

  BookTest(this.title, this.coverImage, this.author);

  static List<BookTest> getbooks() {
     List<BookTest>books = [BookTest("Rivals", 'assets/book1.png', 'Oscar Anyiam'),
      BookTest("Make Love", 'assets/book2.png', 'James Brown'),
      BookTest("Money Matters", 'assets/book3.png', 'Duke Raulen'),
      BookTest("Sell Like Crazy", 'assets/book4.png', 'Jeje Noje')];
    return books;
  }
}
