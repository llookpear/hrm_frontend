import '../models/enum.dart';

class Format {
  Format();

  static String statusName(int statusID) {
    switch (statusID) {
      case 1:
        return "Request";
      case 2:
        return "Confirm";
      case 3:
        return "Cancel";
      case 4:
        return "Success";
      case 5:
        return "Pending";
    }
    return "Request";
  }

  static int statusID(StatusName item) {
    switch (item) {
      case StatusName.Request:
        return 1;
      case StatusName.Confirm:
        return 2;
      case StatusName.Cancel:
        return 3;
      case StatusName.Success:
        return 4;
      case StatusName.Pending:
        return 5;
    }
  }

  static String leaveName(int leaveID) {
    switch (leaveID) {
      case 1:
        return "Vacation leave";
      case 2:
        return "Sick leave";
      case 3:
        return "Casual leave";
      case 4:
        return "Leave Etc";
    }
    return "All";
  }

  static slipType? slipTypeFromId(int id) {
    switch (id) {
      case 1:
        return slipType.Earnings;
      case 2:
        return slipType.Deductions;
    }
    return null;
  }

  static TabNameAdmin getTabNameAdminFromStatusID(int statusID) {
    switch (statusID) {
      case 1:
        return TabNameAdmin.Request;
      case 2:
        return TabNameAdmin.Confirm;
      case 3:
        return TabNameAdmin.Cancel;
      default:
        return TabNameAdmin.All;
    }
  }

  static String getTabNameAdminDisplay(TabNameAdmin tabName) {
    switch (tabName) {
      case TabNameAdmin.All:
        return 'All';
      case TabNameAdmin.Request:
        return 'Request';
      case TabNameAdmin.Confirm:
        return 'Confirm';
      case TabNameAdmin.Cancel:
        return 'Cancel';
      default:
        return 'Unknown';
    }
  }

  // static String getCheckType (CheckType type) {
  //   switch (type) {
  //     case CheckType.Beacon:
  //       return '101';
  //     case CheckType.GPS:
  //       return '102';
  //   }
  // }

  static String getCheckType(CheckType checkType, Type type) {
    if (checkType == CheckType.GPS && type == Type.In) {
      return '101';
    } else if (checkType == CheckType.GPS && type == Type.Out) {
      return '102';
    } else if (checkType == CheckType.Beacon && type == Type.In) {
      return '201';
    } else if (checkType == CheckType.Beacon && type == Type.Out) {
      return '202';
    }
    return 'Unknown';
  }


}
