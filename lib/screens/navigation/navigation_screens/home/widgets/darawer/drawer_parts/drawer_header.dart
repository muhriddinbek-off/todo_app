import 'package:flutter/material.dart';

import '../../../../../../../utils/export_link.dart';

class DrawerHeaderPart extends StatelessWidget {
  const DrawerHeaderPart({super.key});

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: AppColors.c9741CC,
            radius: 30.r,
            backgroundImage: StorageRepository.getString(key: AppConstanta.accountImage) != ""
                ? FileImage(
                    File(
                      StorageRepository.getString(key: AppConstanta.accountImage),
                    ),
                  )
                : AssetImage(AppImages.accountImage),
          ),
          10.getH(),
          Row(
            children: [
              Text(
                StorageRepository.getString(key: AppConstanta.firstName),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              10.getW(),
              Text(
                StorageRepository.getString(key: AppConstanta.lastName),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
