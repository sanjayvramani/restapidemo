extension StringExtension on String?
{
  bool get isNullorEmpty => this==null || this!.isEmpty;

  bool get isNotNullorEmpty => this!=null || this!.isEmpty; 
}