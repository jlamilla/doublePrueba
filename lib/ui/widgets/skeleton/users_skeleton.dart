import 'package:flutter/material.dart';
import 'package:prueba/ui/widgets/skeleton/skeleton.dart';

class UsersSkeltonLoading extends StatelessWidget {

  const UsersSkeltonLoading({Key? key, required this.itemCount,}) : super(key: key);

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
    return Padding(
      padding: const EdgeInsets.symmetric( vertical:  15),
      child: Column(
            children: const[
              CircleSkeleton(size: 110,),
              SizedBox(height: 20,),
              Skeleton(width: 200,),
              SizedBox(height: 7,),
              Skeleton(width: 200,),
              SizedBox(height: 7,),
              Skeleton(width: 200,),
              SizedBox(height: 10,),
              Skeleton(width: 200,),
            ],
          ),
    );
  }
}