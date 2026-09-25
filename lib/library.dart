import 'package:flutter/material.dart';
import 'bookModels.dart';
import 'detail.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F5FB),

      body: Column(
        children: [

          // =========================
          // HEADER
          // =========================
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(
              20,
              22,
              20,
              18,
            ),

            decoration: const BoxDecoration(
              color: Color(0xFF4A5BC7),

              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),

            child: Row(
              children: [

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: [
                      const Text(
                        'Welcome to Mylibrary 👋',

                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 5),

                      Text(
                        '${bookList.length} books available to explore',

                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: const EdgeInsets.all(13),

                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    shape: BoxShape.circle,
                  ),

                  child: const Icon(
                    Icons.auto_stories_outlined,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ],
            ),
          ),

          // =========================
          // BOOK GRID
          // =========================
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(
                18,
                20,
                18,
                25,
              ),

              itemCount: bookList.length,

              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 18,
                childAspectRatio: 0.61,
              ),

              itemBuilder: (context, index) {
                final BookModel book = bookList[index];

                return _BookCard(book: book);
              },
            ),
          ),
        ],
      ),
    );
  }
}


// =====================================================
// BOOK CARD
// =====================================================

class _BookCard extends StatelessWidget {
  final BookModel book;

  const _BookCard({
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,

      child: InkWell(
        borderRadius: BorderRadius.circular(20),

        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  BookDetailPage(book: book),
            ),
          );
        },

        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),

            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.07),
                blurRadius: 12,
                offset: const Offset(0, 5),
              ),
            ],
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              // =========================
              // COVER
              // =========================

              Expanded(
                flex: 7,

                child: Stack(
                  children: [

                    ClipRRect(
                      borderRadius:
                          const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),

                      child: SizedBox(
                        width: double.infinity,
                        height: double.infinity,

                        child: Image.network(
                          book.imageUrl,
                          fit: BoxFit.cover,

                          errorBuilder:
                              (context, error, stackTrace) {
                            return Container(
                              color: const Color(0xFFE9E7EC),

                              child: const Center(
                                child: Icon(
                                  Icons.menu_book_rounded,
                                  size: 55,
                                  color: Colors.grey,
                                ),
                              ),
                            );
                          },

                          loadingBuilder:
                              (context, child, progress) {
                            if (progress == null) {
                              return child;
                            }

                            return const Center(
                              child:
                                  CircularProgressIndicator(),
                            );
                          },
                        ),
                      ),
                    ),

                    // =========================
                    // RATING BADGE
                    // =========================

                    Positioned(
                      top: 10,
                      right: 10,

                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 9,
                          vertical: 6,
                        ),

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(20),

                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.black.withOpacity(0.12),
                              blurRadius: 6,
                            ),
                          ],
                        ),

                        child: Row(
                          children: [
                            const Icon(
                              Icons.star_rounded,
                              size: 16,
                              color: Colors.amber,
                            ),

                            const SizedBox(width: 3),

                            Text(
                              book.rating.toString(),

                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // =========================
              // BOOK INFO
              // =========================

              Expanded(
                flex: 4,

                child: Padding(
                  padding: const EdgeInsets.fromLTRB(
                    13,
                    11,
                    13,
                    10,
                  ),

                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: [

                      Text(
                        book.title,

                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,

                        style: const TextStyle(
                          fontSize: 16,
                          height: 1.2,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF252525),
                        ),
                      ),

                      const SizedBox(height: 5),

                      Text(
                        book.author,

                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,

                        style: const TextStyle(
                          fontSize: 12.5,
                          color: Colors.grey,
                        ),
                      ),

                      const Spacer(),

                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,

                        children: [

                          // GENRE
                          Container(
                            padding:
                                const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),

                            decoration: BoxDecoration(
                              color: const Color(0xFFF0F1FF),
                              borderRadius:
                                  BorderRadius.circular(8),
                            ),

                            child: Text(
                              book.genre,

                              maxLines: 1,
                              overflow:
                                  TextOverflow.ellipsis,

                              style: const TextStyle(
                                fontSize: 10,
                                color: Color(0xFF4A5BC7),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),

                          Text(
                            book.year.toString(),

                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF777777),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}