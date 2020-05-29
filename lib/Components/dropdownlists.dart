import 'package:flutter/material.dart';


List<DropdownMenuItem> drop1 = [
  DropdownMenuItem(
    value: 10,
    child: Text('10'),
  ),
].cast<DropdownMenuItem<int>>();

List<DropdownMenuItem> drop2 = [
  DropdownMenuItem(
    value: 10,
    child: Text('10'),
  ),
  DropdownMenuItem(
    value: 20,
    child: Text(
      "20",
    ),
  ),
].cast<DropdownMenuItem<int>>();

List<DropdownMenuItem<int>> drop3 = [
  DropdownMenuItem<int>(
    value: 10,
    child: Text('10'),
  ),
  DropdownMenuItem<int>(
    value: 20,
    child: Text(
      "20",
    ),
  ),
  DropdownMenuItem<int>(
    value: 30,
    child: Text(
      "30",
    ),
  ),
].cast<DropdownMenuItem<int>>();

List<DropdownMenuItem<int>> drop4 = [
  DropdownMenuItem<int>(
    value: 10,
    child: Text('10'),
  ),
  DropdownMenuItem<int>(
    value: 20,
    child: Text(
      "20",
    ),
  ),
  DropdownMenuItem<int>(
    value: 30,
    child: Text(
      "30",
    ),
  ),
  DropdownMenuItem<int>(
    value: 50,
    child: Text(
      "50",
    ),
  ),
];

