import 'package:easy_pos/data.dart';
import 'package:flutter/material.dart';
import 'Customer.dart';

class AddCustomerScreen extends StatefulWidget {
  const AddCustomerScreen({super.key});

  @override
  State<AddCustomerScreen> createState() => _AddCustomerScreenState();
}

class _AddCustomerScreenState extends State<AddCustomerScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController taxController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController desController = TextEditingController();
  String cityvalue = "Hà Nội";
  int typeVal = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, null);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text("Thêm khách hàng"),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            const Text("Họ tên"),
            inputName(),
            const SizedBox(
              height: 10,
            ),
            const Text("Số điện thoại"),
            inputPhoneNumber(),
            const SizedBox(
              height: 10,
            ),
            const Text("Loại khách hàng"),
            typess(),
            const SizedBox(
              height: 10,
            ),
            const Text("Thành phố"),
            city(),
            const SizedBox(
              height: 10,
            ),
            const Text("Quận/huyện"),
            inputForm("Ví dụ: Mễ Trì", districtController),
            const SizedBox(
              height: 10,
            ),
            const Text("Địa chỉ"),
            inputForm("Ví dụ: Số 8 Phạm Hùng", addressController),
            const SizedBox(
              height: 10,
            ),
            const Text("Mã số thuế"),
            inputTaxNumber(),
            const SizedBox(
              height: 10,
            ),
            const Text("Email"),
            inputEmail(),
            const SizedBox(
              height: 10,
            ),
            const Text("Mô tả"),
            inputForm("Ví dụ: Không .-. ", desController),
            ElevatedButton(
              onPressed: () {
                Customer item = Customer(
                    name: nameController.text,
                    type: typeVal,
                    city: cityvalue,
                    district: districtController.text,
                    phoneNumber: phoneController.text,
                    address: addressController.text,
                    email: emailController.text,
                    taxcode: taxController.text,
                    idNumber: idController.text,
                    description: desController.text);
                if (formKey.currentState!.validate()) {
                  Navigator.pop(context, item);
                }
              },
              child: const Text(
                "Thêm",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }

  TextFormField inputName() {
    return TextFormField(
      controller: nameController,
      decoration: const InputDecoration(hintText: "VD: Trần Thị Trà Mi"),
      validator: (value) {
        return value == "" ? "Vui lòng nhập tên khách hàng" : null;
      },
    );
  }

  TextFormField inputPhoneNumber() {
    return TextFormField(
      controller: phoneController,
      decoration: const InputDecoration(hintText: "VD: 0123456789"),
      validator: (value) {
        return (value!.length != 10 && value.length != 14)
            ? "Số điện thoại phải có 10 hoặc 14 kí tự"
            : null;
      },
      maxLength: 14,
    );
  }

  TextFormField inputTaxNumber() {
    return TextFormField(
      controller: taxController,
      decoration: const InputDecoration(hintText: "VD: 00000000000"),
      validator: (value) {
        return (value!.length != 9 && value.length != 13)
            ? "Mã số thuế phải có 9 hoặc 13 kí tự"
            : null;
      },
      maxLength: 13,
    );
  }

  Widget inputForm(String hint, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(hintText: hint),
    );
  }

  Widget typess() {
    return DropdownButtonFormField<int>(
      value: typeVal,
      items: [
        DropdownMenuItem(
          value: 1,
          child: Text(
            types[1]!,
          ),
        ),
        DropdownMenuItem(
          value: 2,
          child: Text(
            types[2]!,
          ),
        ),
        DropdownMenuItem(
          value: 3,
          child: Text(
            types[3]!,
          ),
        ),
      ],
      onChanged: (value) {
        setState(() {
          typeVal = value!;
        });
      },
    );
  }

  TextFormField inputEmail() {
    return TextFormField(
        controller: emailController,
        decoration: const InputDecoration(hintText: "VD: mee@gmail.com"),
        validator: (value) {
          if (value != "") {
            if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value!)) {
              return "Email không đúng định dạng";
            }
          }
          // return (value != null &&
          //         !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value))
          //     ? "Email không đúng định dạng"
          //     : null;
        });
  }

  Widget city() {
    return DropdownButtonFormField<String>(
      value: cityvalue,
      items: List.generate(
        listCity.length,
        (index) => DropdownMenuItem(
          value: listCity[index],
          child: Text(listCity[index]),
        ),
      ),
      onChanged: (value) {
        setState(() {
          cityvalue = value!;
        });
      },
    );
  }
}
