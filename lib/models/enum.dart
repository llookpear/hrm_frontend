
enum SortBy { ID, Date, Status }


enum UserPermission { user, admin}

enum EventType { dayoff, ot , leave}

enum CheckType { Beacon, GPS }
enum Type { In, Out }

enum StatusName { Request, Confirm, Cancel, Success, Pending }

enum TabNameAdmin {
  All,
  Request,
  Confirm,
  Cancel,
}

enum Request { Leave, Overtime, ShiftWork, Payroll }

enum slipType {
  Earnings,
  Deductions,
}

enum ProfileMenu { Profile, Password, Logout }

enum LeaveType {
  Vacation('Vacation leave'),
  Sick('Sick leave'),
  Casual('Casual leave'),
  LeaveEtc('Leave Etc');

  final String name;

  const LeaveType(this.name);
}
