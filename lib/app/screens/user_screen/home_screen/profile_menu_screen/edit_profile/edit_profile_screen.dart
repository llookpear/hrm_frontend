import 'dart:io';
import 'dart:typed_data';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hrm_project/app/widgets/appbar_widget.dart';
import 'package:hrm_project/app/widgets/class/convert_datetime_number.dart';
import 'package:hrm_project/app/widgets/elevated_button_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:octo_image/octo_image.dart';
import '../../../../../../models/user/user_detail/user_detail_model.dart';
import '../../../../../../utils/api_constant/api_constant.dart';
import '../../../../../../utils/style/app_color.dart';
import '../../../../../widgets/class/icons.dart';
import '../../../../../widgets/fonts_style_widget.dart';
import '../../../../../widgets/text_form_field_widget.dart';
import 'edit_profile_provider.dart';

class EditProfileScreenWidget extends HookConsumerWidget {
  final UserDetailModel userDetail;
  final String image;

  const EditProfileScreenWidget(
      {super.key, required this.userDetail, required this.image});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ConvertDateTime convert = ConvertDateTime();
    final firstnameController =
        TextEditingController(text: userDetail.firstname);
    final lastnameController = TextEditingController(text: userDetail.lastname);
    final emailController = TextEditingController(text: userDetail.email);
    final String formattedDate =
        convert.convertDateddMMMMyyyy(userDetail.dateOfBirth.toString());
    final dateOfBirthController = TextEditingController(text: formattedDate);
    final phoneController = TextEditingController(text: userDetail.phone);
    final userIDController =
        TextEditingController(text: userDetail.staffID.toString());
    final oldFilenameController =
        TextEditingController(text: userDetail.userImage);
    const String appBarTitle = "Profile";
    const String firstnameTitleTextForm = "Firstname";
    const String lastnameTitleTextForm = "Lastname";
    const String emailTitleTextForm = "Email";
    const String dateOfBirthTitleTextForm = "Date of birth";
    const String phoneNumberTitleTextForm = "Phone number";
    const String idTitleTextForm = "Staff ID";
    const String updateButton = "Update Profile";

    final pickedImage = useState<XFile?>(null);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColor.backgroundColor,
        appBar: AppBarWidget(
          title: appBarTitle,
          onPressed: () {
            Navigator.pop(context);
          },
          color: AppColor.darkGreyColor,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(clipBehavior: Clip.none, children: [
                      pickedImage.value == null
                          ? ClipOval(
                              child: OctoImage(
                                errorBuilder: (_, __, ___) =>
                                    AppIcons.userDefaultImg(),
                                image: CachedNetworkImageProvider(
                                    APIConstance.getImage(image)),
                                width: MediaQuery.of(context).size.width * 0.25,
                                height:
                                    MediaQuery.of(context).size.width * 0.25,
                                fit: BoxFit.cover,
                              ),
                            )
                          : ClipOval(
                              child: Image.file(
                                File(pickedImage.value!.path),
                                width: MediaQuery.of(context).size.width * 0.25,
                                height:
                                    MediaQuery.of(context).size.width * 0.25,
                                fit: BoxFit.cover,
                              ),
                            ),
                      Positioned(
                        top: 50,
                        right: -20,
                        child: Card(
                          color: AppColor.borderSideColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: IconButton(
                            icon: const Icon(
                              size: 20,
                              Icons.camera_alt,
                              color: AppColor.darkGreyColor,
                            ),
                            onPressed: () async {
                              final image = await ImagePicker()
                                  .pickImage(source: ImageSource.gallery);
                              if (image != null) {
                                pickedImage.value = image;
                              }
                            },
                          ),
                        ),
                      ),
                    ])
                  ],
                ),
                const FontsStyle(
                    text: firstnameTitleTextForm,
                    color: AppColor.lightGreyColor,
                    weight: FontWeight.w100),
                TextFormFieldWidget(controller: firstnameController),
                const SizedBox(height: 8),
                const FontsStyle(
                    text: lastnameTitleTextForm,
                    color: AppColor.lightGreyColor,
                    weight: FontWeight.w100),
                TextFormFieldWidget(controller: lastnameController),
                const SizedBox(height: 8),
                const FontsStyle(
                    text: emailTitleTextForm,
                    color: AppColor.lightGreyColor,
                    weight: FontWeight.w100),
                TextFormFieldWidget(controller: emailController),
                const SizedBox(height: 8),
                const FontsStyle(
                    text: phoneNumberTitleTextForm,
                    color: AppColor.lightGreyColor,
                    weight: FontWeight.w100),
                TextFormFieldWidget(controller: phoneController),
                const SizedBox(height: 8),
                const FontsStyle(
                    text: dateOfBirthTitleTextForm,
                    color: AppColor.lightGreyColor,
                    weight: FontWeight.w100),
                TextFormFieldWidget(
                  readOnly: true,
                  controller: dateOfBirthController,
                  textColor: AppColor.lightGreyColor,
                ),
                const SizedBox(height: 8),
                const FontsStyle(
                    text: idTitleTextForm,
                    color: AppColor.lightGreyColor,
                    weight: FontWeight.w100),
                TextFormFieldWidget(
                  readOnly: true,
                  controller: userIDController,
                  textColor: AppColor.lightGreyColor,
                ),
                const SizedBox(height: 8),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        ElevatedButtonWidget(
                          title: updateButton,
                          onPressed: () {
                            final firstName = firstnameController.text;
                            final lastName = lastnameController.text;
                            final phone = phoneController.text;
                            final email = emailController.text;

                            final oldFile =
                                (oldFilenameController.text.isNotEmpty &&
                                        oldFilenameController.text != "-")
                                    ? oldFilenameController.text
                                    : null;
                            final newImage = pickedImage.value != null
                                ? pickedImage.value
                                : null;
                            ref.read(editProfileProvider).updateProfile(
                                  firstName,
                                  lastName,
                                  phone,
                                  email,
                                  oldFile,
                                  newImage,
                                  context,
                                );
                          },
                        ),
                      ],
                    ),
                  ],
                )),
              ],
            ),
          ),
        ));
  }
}
