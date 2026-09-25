import 'package:flutter/material.dart';
import 'bookModels.dart';

class BookDetailPage extends StatelessWidget {
  final BookModel book;

  const BookDetailPage({
    super.key,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F5FB),

      body: CustomScrollView(
        slivers: [

          // =================================================
          // APP BAR + COVER
          // =================================================

          SliverAppBar(
            expandedHeight: 390,
            pinned: true,

            backgroundColor: const Color(0xFF4A5BC7),
            foregroundColor: Colors.white,

            elevation: 0,

            title: const Text(
              'Book Details',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: const Color(0xFF4A5BC7),

                child: SafeArea(
                  child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.end,

                    children: [

                      // COVER
                      Container(
                        width: 185,
                        height: 250,

                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(14),

                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.black.withOpacity(0.25),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),

                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(14),

                          child: Image.network(
                            book.imageUrl,
                            fit: BoxFit.cover,

                            errorBuilder:
                                (context, error, stackTrace) {
                              return Container(
                                color:
                                    const Color(0xFFE9E7EC),

                                child: const Center(
                                  child: Icon(
                                    Icons.menu_book_rounded,
                                    size: 70,
                                    color: Colors.grey,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),

                      const SizedBox(height: 25),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // =================================================
          // CONTENT
          // =================================================

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                20,
                25,
                20,
                35,
              ),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  // TITLE
                  Text(
                    book.title,

                    style: const TextStyle(
                      fontSize: 27,
                      height: 1.15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF222222),
                    ),
                  ),

                  const SizedBox(height: 8),

                  Row(
                    children: [

                      const Icon(
                        Icons.person_outline,
                        size: 18,
                        color: Color(0xFF4A5BC7),
                      ),

                      const SizedBox(width: 6),

                      Text(
                        book.author,

                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 18),

                  // GENRE + RATING
                  Row(
                    children: [

                      _tag(
                        Icons.category_outlined,
                        book.genre,
                      ),

                      const SizedBox(width: 10),

                      _tag(
                        Icons.star_rounded,
                        book.rating.toString(),
                        isRating: true,
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // INFORMATION
                  _sectionTitle(
                    'Informasi Buku',
                    Icons.info_outline,
                  ),

                  const SizedBox(height: 15),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(18),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(18),

                      boxShadow: [
                        BoxShadow(
                          color:
                              Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),

                    child: Column(
                      children: [

                        _infoItem(
                          Icons.calendar_month_outlined,
                          'Tahun Terbit',
                          book.year.toString(),
                        ),

                        _divider(),

                        _infoItem(
                          Icons.business_outlined,
                          'Penerbit',
                          book.publisher,
                        ),

                        _divider(),

                        _infoItem(
                          Icons.menu_book_outlined,
                          'Jumlah Halaman',
                          '${book.pages} halaman',
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  // DESCRIPTION
                  _sectionTitle(
                    'Deskripsi / Sinopsis',
                    Icons.auto_stories_outlined,
                  ),

                  const SizedBox(height: 14),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(18),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(18),

                      boxShadow: [
                        BoxShadow(
                          color:
                              Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),

                    child: Text(
                      book.description,

                      style: const TextStyle(
                        fontSize: 15.5,
                        height: 1.65,
                        color: Color(0xFF444444),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // BACK BUTTON
                  SizedBox(
                    width: double.infinity,
                    height: 55,

                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },

                      icon: const Icon(
                        Icons.arrow_back_rounded,
                      ),

                      label: const Text(
                        'Kembali ke Library',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xFF4A5BC7),

                        foregroundColor: Colors.white,

                        elevation: 0,

                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // =====================================================
  // SECTION TITLE
  // =====================================================

  static Widget _sectionTitle(
    String title,
    IconData icon,
  ) {
    return Row(
      children: [

        Container(
          padding: const EdgeInsets.all(8),

          decoration: BoxDecoration(
            color: const Color(0xFFEDEFFF),
            borderRadius: BorderRadius.circular(10),
          ),

          child: Icon(
            icon,
            size: 20,
            color: const Color(0xFF4A5BC7),
          ),
        ),

        const SizedBox(width: 10),

        Text(
          title,

          style: const TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
            color: Color(0xFF222222),
          ),
        ),
      ],
    );
  }

  // =====================================================
  // TAG
  // =====================================================

  static Widget _tag(
    IconData icon,
    String text, {
    bool isRating = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),

      decoration: BoxDecoration(
        color: isRating
            ? const Color(0xFFFFF5D8)
            : const Color(0xFFEDEFFF),

        borderRadius: BorderRadius.circular(12),
      ),

      child: Row(
        children: [

          Icon(
            icon,
            size: 17,
            color: isRating
                ? Colors.amber[700]
                : const Color(0xFF4A5BC7),
          ),

          const SizedBox(width: 5),

          Text(
            text,

            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: isRating
                  ? Colors.amber[800]
                  : const Color(0xFF4A5BC7),
            ),
          ),
        ],
      ),
    );
  }

  // =====================================================
  // INFORMATION ITEM
  // =====================================================

  static Widget _infoItem(
    IconData icon,
    String label,
    String value,
  ) {
    return Row(
      children: [

        Container(
          padding: const EdgeInsets.all(9),

          decoration: BoxDecoration(
            color: const Color(0xFFF0F1FF),
            borderRadius: BorderRadius.circular(10),
          ),

          child: Icon(
            icon,
            color: const Color(0xFF4A5BC7),
            size: 20,
          ),
        ),

        const SizedBox(width: 13),

        Expanded(
          child: Text(
            label,

            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ),

        Flexible(
          child: Text(
            value,

            textAlign: TextAlign.right,

            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF333333),
            ),
          ),
        ),
      ],
    );
  }

  static Widget _divider() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 13),
      child: Divider(
        height: 1,
        color: Color(0xFFEDEDED),
      ),
    );
  }
}