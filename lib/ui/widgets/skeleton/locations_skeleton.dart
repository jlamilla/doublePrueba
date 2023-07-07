import 'package:flutter/material.dart';
import 'package:prueba/ui/widgets/skeleton/skeleton.dart';

class LocationSkeltonLoading extends StatelessWidget {

  const LocationSkeltonLoading({Key? key, required this.itemCount,}) : super(key: key);

  final int itemCount;
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: itemCount,
            itemBuilder: (_, __) => const _NewsCardSkelton(),
          );
  }
}

class _NewsCardSkelton extends StatelessWidget {
  
  const _NewsCardSkelton({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            Container(
              height: 80,
              margin:  const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                    const Skeleton(width: 99, height: 99,),
                    Padding(
                      padding: const EdgeInsets.symmetric( vertical: 10, horizontal: 20 ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const[
                          Skeleton(width: 200,),
                          SizedBox(height: 5,),
                          Skeleton(width: 200,),
                          SizedBox(height: 5,),
                          Skeleton(width: 200,),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        );
  }
}
