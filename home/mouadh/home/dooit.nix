{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (dooit.overrideAttrs (old: {
      propagatedBuildInputs = old.propagatedBuildInputs ++ [ dooit-extras ];
    }))
  ];

  home.file.".config/dooit/config.py".text = ''
from dooit.ui.api import DooitAPI, subscribe
from dooit.ui.api.events import Startup
from dooit.api.theme import DooitThemeBase
from dooit.ui.api.widgets import TodoWidget
from rich.style import Style
from dooit_extras.formatters import *
from dooit_extras.bar_widgets import *
from dooit_extras.scripts import *
from rich.text import Text


class Evergarden(DooitThemeBase):
    _name: str = "dooit-evergarden"

    # ------- BACKGROUND COLORS -------
    background1: str = "#1d2428"  # Darkest
    background2: str = "#191E21"
    background3: str = "#171C1F"  # Lightest

    # ------- FOREGROUND COLORS -------
    foreground1: str = "#96B4AA"  # Lightest
    foreground2: str = "#ADC9BC"
    foreground3: str = "#F8F9E8"  # Darkest

    # ------- OTHER COLORS -------
    red: str = "#f57f82"
    orange: str = "#F7A182"
    yellow: str = "#f5d098"
    green: str = "#cae0a7"
    blue: str = "#b2cfed"
    purple: str = "#f3c0e5"
    magenta: str = "#F3C0E5"
    cyan: str = "#addeb9"

    # ------- ACCENT COLORS -------
    primary: str = green
    secondary: str = blue


@subscribe(Startup)
def setup_colorscheme(api: DooitAPI, _):
    api.css.set_theme(Evergarden)


@subscribe(Startup)
def setup_formatters(api: DooitAPI, _):
    fmt = api.formatter
    theme = api.vars.theme

    # ------- WORKSPACES -------
    format = Text(" ({}) ", style=theme.primary).markup
    fmt.workspaces.description.add(description_children_count(format))

    # --------- TODOS ---------
    # status formatter
    fmt.todos.status.add(status_icons(completed="󱓻 ", pending="󱓼 ", overdue="󱓼 "))

    # --------- URGENCY ---------
    u_icons = {1: "  󰯬", 2: "  󰯯", 3: "  󰯲", 4: "  󰯵"}
    fmt.todos.urgency.add(urgency_icons(icons=u_icons))

    # --------- DUE ---------
    fmt.todos.due.add(due_casual_format())
    fmt.todos.due.add(due_icon(completed="󰐅 ", pending="󱢗 ", overdue="󱐚 "))

    # --------- EFFORT ---------
    fmt.todos.effort.add(effort_icon(icon="󱠇 "))

    # --------- DESCRIPTION ---------
    format = Text("  {completed_count}/{total_count}", style=theme.yellow).markup
    fmt.todos.description.add(todo_description_progress(fmt=format))
    fmt.todos.description.add(description_highlight_tags(fmt="󰌪 {}"))
    fmt.todos.description.add(description_strike_completed())


@subscribe(Startup)
def setup_layout(api: DooitAPI, _):
    api.layouts.todo_layout = [
        TodoWidget.status,
        TodoWidget.effort,
        TodoWidget.description,
        TodoWidget.due,
        TodoWidget.recurrence
    ]


@subscribe(Startup)
def setup_bar(api: DooitAPI, _):
    theme = api.vars.theme
    mode_style = Style(color=theme.background1, bgcolor=theme.primary, bold=True)

    widgets = [
        Mode(
            api,
            format_normal="NOR",
            format_insert="INS",
            fmt=Text(" 󰌪 {}", style=mode_style).markup,
        ),
        Powerline.right_rounded(api, fg=theme.primary),
        Spacer(api, width=0),
        Powerline.left_rounded(api, fg=theme.primary),
        WorkspaceProgress(api, fmt=" 󰞯 {}% "),
        Powerline.left_rounded(api, fg=theme.yellow, bg=theme.primary),
        Clock(api, format="%H:%M", fmt=" 󰥔 {} ", bg=theme.yellow),
    ]
    api.bar.set(widgets)


@subscribe(Startup)
def setup_dashboard(api: DooitAPI, _):
    theme = api.vars.theme

    ascii_art = r"""
                                                    ____
                                         v        _(    )
        _ ^ _                          v         (___(__)
       '_\V/ `
       ' oX`
          X                             
          X            Help, BAC is close! 
          X          -                                      .
          X        \O/                                      |\
          X.a##a.   M                                       |_\
       .aa########a.>>                                 _____|_____
    .a################aa.                              \  STUDY  /
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"""

    ascii_art = Text(ascii_art, style=theme.primary)
    ascii_art.highlight_words([" Help, BAC is close! "], style="reverse")
    ascii_art.highlight_words([" BAC "], style=theme.secondary)

    header = Text(
        "Welcome again to your daily life, piled with unfinished courses!",
        style=Style(color=theme.secondary, bold=True, italic=True),
    )

    items = [
        header,
        ascii_art,
        "",
        "",
        Text("Will you finish what is waiting?", style=theme.secondary),
        Text("󰠠 Tasks pending today: {}".format(due_today), style=theme.green),
        Text("󰁇 Tasks still overdue: {}".format(overdue), style=theme.red),
    ]
    api.dashboard.set(items)


@subscribe(Startup)
def additional_setup(api: DooitAPI, _):
    dim_unfocused(api, "60%")
  '';
}
