class Validation {
  static bool email(String? email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email!);
  }

  static String? isValidEmail({String? email}) {
    if (email == null) {
      return null;
    }
    if (RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      return null;
    }
    return "Email inválido";
  }

  static String? isNameValid(String? fullName) {
    if (fullName == null) return null;
    if (fullName.trim().split(' ').length < 2) {
      return "Seu nome precisa ser completo";
    }
    return null;
  }

  static String? isValidPassword(String? password) {
    if (password != null && password.length < 8) {
      return "Sua senha precisa ter pelo menos 8 caracteres, digite novamente";
    }
    return null;
  }

  static String? isBirthdayValid(int? day, int? month, int? year,
      {bool isFuture = false, bool isHuman = false}) {
    if (year == null ||
            month == null ||
            day == null ||
            DateTime(year, month, day).isAfter(DateTime.now()) ||
            isFuture
        ? DateTime(year!, month!, day!).isBefore(DateTime.now())
        : (year) > DateTime.now().year ||
            (isHuman ? (year) < 1900 : (year) < 1950) ||
            (month) > 12 ||
            (day) >
                (month == 2
                    ? year % 4 == 0
                        ? 29
                        : 28
                    : [4, 6, 9, 11].contains(month)
                        ? 30
                        : 31)) {
      return "Data inválida, digite novamente";
    }
    return null;
  }

  static double filesize(int size, [int round = 2]) {
    const int divider = 1024;
    final int _size = size;

    if (_size < divider * divider) {
      return double.parse((_size / divider).toStringAsFixed(round));
    }

    if (_size < divider * divider * divider && _size % divider == 0) {
      return double.parse((_size / (divider * divider)).toStringAsFixed(0));
    }

    if (_size < divider * divider * divider) {
      return double.parse((_size / divider / divider).toStringAsFixed(round));
    }
    return 0;
  }

  static String? isdoubleValid(double? number) {
    if (number == null || number.toString().isEmpty) {
      return 'Valor inválido!';
    }
    return null;
  }

  static String? isintValid(int? number) {
    if (number == null || number.toString().isEmpty) {
      return 'Valor inválido!';
    }
    return null;
  }

  static String? isphoneValid(String? phone) {
    if (phone != null) {
      if (phone.length != 15) {
        return 'Celular inválido, digite novamente';
      }
    }
    return null;
  }

  static String? isSusNumberValid(String? sus) {
    if (sus != null) {
      if (sus.length != 18) {
        return 'Número do SUS inválido, digite novamente';
      }
    }
    return null;
  }

  static String? minmaxvalidation(double? value, {double? min, double? max}) {
    final test = isdoubleValid(value);

    if (test == null) {
      if (min != null && value! < min) {
        return 'Mínimo ${min.toInt()}';
      }
      if (max != null && value! > max) {
        return 'Máximo ${max.toInt()}';
      }
    } else {
      return test;
    }
    return null;
  }
}
