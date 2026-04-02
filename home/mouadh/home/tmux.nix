{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    mouse = true;
    prefix = "C-space";
    baseIndex = 1;
    plugins = with pkgs.tmuxPlugins; [
      sensible
      vim-tmux-navigator
      yank
      {
        plugin = catppuccin;
        extraConfig = ''
          set -g @catppuccin_flavor "mocha"
          set -g @catppuccin_status_background "none"
          set -g @catppuccin_window_status_style "none"
          set -g @catppuccin_pane_status_enabled "off"
          set -g @catppuccin_pane_border_status "off"
        '';
      }
    ];
    extraConfig = ''
      set-option -sa terminal-overrides ",xterm*:Tc"


      # setup tpm and pomodoro
      set -g @plugin 'tmux-plugins/tpm'
      set -g @plugin 'olimorris/tmux-pomodoro-plus'

      set -g @pomodoro_toggle 'p'                    # Start/pause a Pomodoro/break
      set -g @pomodoro_cancel 'P'                    # Cancel the current session
      set -g @pomodoro_skip '_'                      # Skip a Pomodoro/break

      set -g @pomodoro_mins 25                       # The duration of the Pomodoro
      set -g @pomodoro_break_mins 5                  # The duration of the break after the Pomodoro completes
      set -g @pomodoro_intervals 4                   # The number of intervals before a longer break is started
      set -g @pomodoro_long_break_mins 25            # The duration of the long break
      set -g @pomodoro_repeat 'off'                  # Automatically repeat the Pomodoros?
      set -g @pomodoro_disable_breaks 'off'          # Turn off breaks

      set -g @pomodoro_on "#[fg=$text_red]󰔟 "                      # The formatted output when the Pomodoro is running
      set -g @pomodoro_complete "#[fg=$text_green]  "                 # The formatted output when the break is running
      set -g @pomodoro_pause "#[fg=$color_yellow]󱦠 "                    # The formatted output when the Pomodoro/break is paused
      set -g @pomodoro_prompt_break "#[fg=$color_green]  ?"      # The formatted output when waiting to start a break
      set -g @pomodoro_prompt_pomodoro "#[fg=$color_gray] ? "   # The formatted output when waiting to start a Pomodoro

      set -g @pomodoro_menu_position "R"             # The location of the menu relative to the screen
      set -g @pomodoro_sound 'on'                   # Sound for desktop notifications (Run `ls /System/Library/Sounds` for a list of sounds to use on Mac)
                                                     # (On Linux add `on` to use the `beep` program or add your custom beeping command)

      set -g @pomodoro_notifications 'on'           # Enable desktop notifications from your terminal
      set -g @pomodoro_granularity 'on'             # Enables MM:SS (ex: 00:10) format instead of the default (ex: 1m)
      set -g status-interval 1

      # config status bar

      # left side
      set -g status-left-length 100
      set -g status-left ""
      set -ga status-left "#{?client_prefix,#{#[bg=#{@thm_red},fg=#{@thm_bg},bold]  #S },#{#[bg=#{@thm_bg},fg=#{@thm_green}]  #S }}"
      set -ga status-left "#[bg=#{@thm_bg},fg=#{@thm_overlay_0},none]│"
      set -ga status-left "#[bg=#{@thm_bg},fg=#{@thm_maroon}]  #{pane_current_command} "
      set -ga status-left "#[bg=#{@thm_bg},fg=#{@thm_overlay_0},none]│"
      set -ga status-left "#[bg=#{@thm_bg},fg=#{@thm_blue}]  #{=/-32/...:#{s|$USER|~|:#{b:pane_current_path}}} "
      set -ga status-left "#[bg=#{@thm_bg},fg=#{@thm_overlay_0},none]#{?window_zoomed_flag,│,}"
      set -ga status-left "#[bg=#{@thm_bg},fg=#{@thm_yellow}]#{?window_zoomed_flag,  zoom ,}"

      # right side
      set -g status-right-length 100
      set -g status-right ""
      set -ga status-right "#[bg=#{@thm_bg},fg=#{@thm_red}] #{pomodoro_status} "
      set -ga status-right "#[bg=#{@thm_bg},fg=#{@thm_overlay_0}, none]│"
      set -ga status-right "#[bg=#{@thm_bg},fg=#{@thm_blue}] 󰭦 %Y-%m-%d 󰅐 %H:%M "
      
      # Configure Tmux
      set -g status-position top
      set -g status-style "bg=#{@thm_bg}"
      set -g status-justify "absolute-centre"

      # pane border look and feel
      setw -g pane-border-status top
      setw -g pane-border-format ""
      setw -g pane-active-border-style "bg=#{@thm_bg},fg=#{@thm_overlay_0}"
      setw -g pane-border-style "bg=#{@thm_bg},fg=#{@thm_surface_0}"
      setw -g pane-border-lines single

      # window look and feel
      set -wg automatic-rename on
      set -g automatic-rename-format "Window"

      set -g window-status-format " #I#{?#{!=:#{window_name},Window},: #W,} "
      set -g window-status-style "bg=#{@thm_bg},fg=#{@thm_rosewater}"
      set -g window-status-last-style "bg=#{@thm_bg},fg=#{@thm_peach}"
      set -g window-status-activity-style "bg=#{@thm_red},fg=#{@thm_bg}"
      set -g window-status-bell-style "bg=#{@thm_red},fg=#{@thm_bg},bold"
      set -gF window-status-separator "#[bg=#{@thm_bg},fg=#{@thm_overlay_0}]│"

      set -g window-status-current-format " #I#{?#{!=:#{window_name},Window},: #W,} "
      set -g window-status-current-style "bg=#{@thm_peach},fg=#{@thm_bg},bold"

      # ── keybinds ──────────────────────────────────────────────────────

      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R
      bind L send-keys '^L'

      set -g pane-base-index 1
      set-window-option -g pane-base-index 1
      set-option -g renumber-windows on

      bind -n M-Left select-pane -L
      bind -n M-Right select-pane -R
      bind -n M-Up select-pane -U
      bind -n M-Down select-pane -D
      bind -n S-Left previous-window
      bind -n S-Right next-window
      bind -n M-H previous-window
      bind -n M-L next-window

      set-window-option -g mode-keys vi
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel

      bind '"' split-window -v -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"
      bind c new-window -c "#{pane_current_path}"

      run '~/.tmux/plugins/tpm/tpm'
    '';
  };
}
