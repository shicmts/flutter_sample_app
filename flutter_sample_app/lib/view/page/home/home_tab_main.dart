import 'package:flutter/material.dart';

/// 여긴 뭐할까
/// 네이티브 호출하기 네이티브에 값 저장하기 ! AOS Room 사용
/// 1. 텍스트입력
/// 2. 로컬에 저장
/// 3. 리스트로 보이기
/// 4. 로컬로 푸시 보내보기
class HomeTabMain extends StatelessWidget {
  const HomeTabMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchTextController = TextEditingController();

    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // TextField
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0x1e6b66a6),
                    Color(0x1e75d1dd),
                  ],
                ),
              ),
              child: TextField(
                  style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                ),
                controller: searchTextController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search_outlined,
                    color: Colors.white54,
                    size: 32,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white60,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.transparent,
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white38,
                      width: 0.0,
                    ),
                  ),
                  label: const Text(
                    'Search',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w100,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),

          ],
        )
      )
    );
  }


}