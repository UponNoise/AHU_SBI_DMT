#!/usr/bin/env python3
import sys
from pathlib import Path

import gi

gi.require_version("Gtk", "3.0")
from gi.repository import Gdk, Gtk, Pango


def main() -> None:
    if len(sys.argv) < 3:
        raise SystemExit("usage: show_hw7_text_gtk.py TITLE TEXT_FILE")
    title = sys.argv[1]
    text = Path(sys.argv[2]).read_text(encoding="utf-8", errors="replace")

    css = b"""
    window { background: #f7f7f7; }
    textview, text { background: #ffffff; color: #111111; }
    """
    provider = Gtk.CssProvider()
    provider.load_from_data(css)
    Gtk.StyleContext.add_provider_for_screen(
        Gdk.Screen.get_default(), provider, Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION
    )

    window = Gtk.Window(title=title)
    window.set_default_size(1050, 650)
    window.set_position(Gtk.WindowPosition.CENTER)
    window.set_keep_above(True)
    window.connect("destroy", Gtk.main_quit)

    view = Gtk.TextView()
    view.set_editable(False)
    view.set_cursor_visible(False)
    view.set_wrap_mode(Gtk.WrapMode.WORD_CHAR)
    view.modify_font(Pango.FontDescription("Monospace 14"))
    view.set_left_margin(18)
    view.set_right_margin(18)
    view.set_top_margin(16)
    view.set_bottom_margin(16)
    view.get_buffer().set_text(text)

    scroller = Gtk.ScrolledWindow()
    scroller.add(view)
    window.add(scroller)
    window.show_all()
    window.present()
    Gtk.main()


if __name__ == "__main__":
    main()
