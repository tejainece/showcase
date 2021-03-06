// Copyright (c) 2016, electron.dart. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import "package:nodejs/nodejs.dart" as nodejs;
import "package:electron/main.dart" as tron;

import "package:showcase/datauri/datauris.dart" as datauris;

main() {
  tron.app.onWindowAllClosed.listen((_) {
    if (nodejs.process.platform != "darwin") {
      tron.app.quit();
    }
  });

  tron.app.onReady.listen(afterAppReady);
}

tron.BrowserWindow _win;

afterAppReady(_) {
  _win = new tron.BrowserWindow();
  _win.loadURL("file://${nodejs.dirname}/client/index.html");

  _setPopup();

  _setAppMenu();
}

_setPopup() {
  final menu = new tron.Menu();

  final item1 = new tron.MenuItem(new tron.MenuItemOptions(label: "Item1"));

  menu.append(item1);

  menu.popup(_win);
}

_setAppMenu() {
  final menu = new tron.Menu();

  final item1 = new tron.MenuItem(new tron.MenuItemOptions(label: "Item1"));

  menu.append(item1);

  tron.Menu.setApplicationMenu(menu);
}