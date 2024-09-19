import 'package:flutter/material.dart';
import '../../../../utils/export_link.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  String firstName = '';
  String lastName = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: BlocBuilder<InitialValueCubit, InitialValueState>(
          builder: (context, state) {
            return SizedBox(
              height: height,
              width: width,
              child: Column(
                children: [
                  Text(
                    "profile".tr(),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  16.getH(),
                  CircleAvatar(
                    radius: 50.h,
                    backgroundImage: StorageRepository.getString(key: AppConstanta.accountImage) != ""
                        ? FileImage(
                            File(
                              StorageRepository.getString(key: AppConstanta.accountImage),
                            ),
                          )
                        : AssetImage(AppImages.accountImage),
                  ),
                  16.getH(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        StorageRepository.getString(key: AppConstanta.firstName),
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      10.getW(),
                      Text(
                        StorageRepository.getString(key: AppConstanta.lastName),
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                  30.getH(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Text(
                          "settings".tr(),
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      getUserInfoItem(context, AppIcons.settings, "app_settings".tr(), () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsWidget()));
                      }),
                      16.getH(),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Text(
                          "account".tr(),
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      getUserInfoItem(context, AppIcons.user, "change_account_name".tr(), () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return ChangeUserName(
                              onFirst: (value) {
                                firstName = value;
                              },
                              onLast: (value) {
                                lastName = value;
                              },
                              onChangeValue: () {
                                if (firstName.isNotEmpty && lastName.isNotEmpty) {
                                  context.read<InitialValueCubit>().getCreateFullName(first: firstName, last: lastName);
                                  Navigator.pop(context);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("info_full".tr()),
                                    ),
                                  );
                                }
                              },
                            );
                          },
                        );
                      }),
                      getUserInfoItem(context, AppIcons.edit, "change_account_picture".tr(), () {
                        context.read<InitialValueCubit>().getImage(_image, _picker);
                      }),
                      16.getH(),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Text(
                          "other".tr(),
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      getUserInfoItem(
                        context,
                        AppIcons.logout,
                        "log_out".tr(),
                        () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return LogOutWidget(
                                onTap: () {
                                  StorageRepository.setBool(key: AppConstanta.storageValue, value: false);
                                  StorageRepository.setString(key: AppConstanta.firstName, value: "");
                                  StorageRepository.setString(key: AppConstanta.lastName, value: "");
                                  context.read<OnboardingCubit>().getPage(0);
                                  Navigator.pushNamedAndRemoveUntil(context, AppRouteName.splash, (context) => false);
                                },
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget getUserInfoItem(BuildContext context, String iconName, String title, Function() func) {
    return ListTile(
      onTap: func,
      leading: SvgPicture.asset(
        iconName,
        colorFilter: ColorFilter.mode(
          AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light ? AppColors.black : AppColors.white,
          BlendMode.srcIn,
        ),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.navigate_next_rounded)),
    );
  }
}
