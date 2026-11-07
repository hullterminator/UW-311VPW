<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>UW-311VPW - Root Terminal</title>
  <style>
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    body {
      background-color: #0c0c0c;
      color: #cccccc;
      font-family: 'Cascadia Code', 'Fira Code', 'DejaVu Sans Mono', Consolas, 'Courier New', monospace;
      font-size: 14px;
      line-height: 1.45;
      height: 100vh;
      display: flex;
      flex-direction: column;
      overflow: hidden;
      user-select: text;
    }

    /* Window Header / Tab bar */
    #termHeader {
      background-color: #1f1f1f;
      border-bottom: 1px solid #333333;
      padding: 6px 14px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      user-select: none;
      flex-shrink: 0;
      box-shadow: 0 2px 6px rgba(0, 0, 0, 0.4);
    }

    .term-title {
      display: flex;
      align-items: center;
      gap: 10px;
      font-size: 13px;
      font-weight: 600;
      color: #f0f0f0;
    }

    .status-dot {
      width: 10px;
      height: 10px;
      background-color: #107c41;
      border-radius: 50%;
      box-shadow: 0 0 8px #107c41;
      animation: pulse 2s infinite;
    }

    @keyframes pulse {
      0% { opacity: 0.7; }
      50% { opacity: 1; box-shadow: 0 0 12px #39d353; }
      100% { opacity: 0.7; }
    }

    .term-badge {
      background: #2b2b2b;
      color: #58a6ff;
      border: 1px solid #3d3d3d;
      border-radius: 4px;
      padding: 2px 8px;
      font-size: 11px;
      font-weight: normal;
    }

    .header-actions {
      display: flex;
      gap: 8px;
      align-items: center;
    }

    .header-btn {
      background: #2d2d2d;
      color: #cccccc;
      border: 1px solid #3d3d3d;
      border-radius: 4px;
      padding: 3px 10px;
      font-family: inherit;
      font-size: 11px;
      cursor: pointer;
      transition: background 0.15s, color 0.15s;
    }

    .header-btn:hover {
      background: #3c3c3c;
      color: #ffffff;
    }

    /* Toolbar for quick commands */
    #quickBar {
      background: #141414;
      border-bottom: 1px solid #222222;
      padding: 4px 14px;
      display: flex;
      gap: 6px;
      flex-wrap: wrap;
      align-items: center;
      flex-shrink: 0;
      font-size: 11px;
    }

    .quick-label {
      color: #777777;
      margin-right: 4px;
    }

    .quick-chip {
      background: #1d1d1d;
      color: #79c0ff;
      border: 1px solid #333333;
      border-radius: 3px;
      padding: 2px 8px;
      cursor: pointer;
      font-family: inherit;
      font-size: 11px;
      transition: all 0.15s;
    }

    .quick-chip:hover {
      background: #264f78;
      color: #ffffff;
      border-color: #58a6ff;
    }

    /* Terminal Container */
    #terminalContainer {
      flex: 1;
      padding: 14px 16px;
      overflow-y: auto;
      overflow-x: hidden;
      cursor: text;
    }

    /* Custom Scrollbar */
    #terminalContainer::-webkit-scrollbar {
      width: 8px;
    }
    #terminalContainer::-webkit-scrollbar-track {
      background: #0c0c0c;
    }
    #terminalContainer::-webkit-scrollbar-thumb {
      background: #333333;
      border-radius: 4px;
    }
    #terminalContainer::-webkit-scrollbar-thumb:hover {
      background: #555555;
    }

    /* Output Styling */
    .banner {
      color: #8b949e;
      margin-bottom: 16px;
      line-height: 1.5;
    }
    .banner .highlight {
      color: #39d353;
      font-weight: bold;
    }
    .banner .brand {
      color: #58a6ff;
      font-weight: bold;
    }

    .term-row {
      margin-bottom: 4px;
      word-break: break-all;
      white-space: pre-wrap;
    }

    .prompt-prefix {
      user-select: none;
    }

    .prompt-user {
      color: #39d353;
      font-weight: bold;
    }

    .prompt-colon {
      color: #ffffff;
    }

    .prompt-path {
      color: #58a6ff;
      font-weight: bold;
    }

    .prompt-hash {
      color: #e3b341;
      font-weight: bold;
    }

    .cmd-executed {
      color: #f0f6fc;
      font-weight: 500;
    }

    .cmd-output {
      color: #d1d5db;
      margin-top: 2px;
      margin-bottom: 10px;
      white-space: pre-wrap;
      word-break: break-all;
    }

    .cmd-error {
      color: #f85149;
    }

    /* Active Prompt Line */
    #activeLine {
      display: flex;
      align-items: center;
      flex-wrap: wrap;
      margin-top: 4px;
    }

    #cmdPrompt {
      display: inline-flex;
      align-items: center;
      white-space: nowrap;
      user-select: none;
      margin-right: 6px;
    }

    .input-wrapper {
      flex: 1;
      min-width: 200px;
      position: relative;
      display: flex;
      align-items: center;
    }

    #cmdInput {
      width: 100%;
      background: transparent;
      border: none;
      outline: none;
      color: #f0f6fc;
      font-family: inherit;
      font-size: 14px;
      line-height: 1.45;
      caret-color: #39d353;
      padding: 0;
      margin: 0;
    }

    /* Running indicator */
    .spinner {
      display: inline-block;
      width: 12px;
      height: 12px;
      border: 2px solid #58a6ff;
      border-radius: 50%;
      border-top-color: transparent;
      animation: spin 0.6s linear infinite;
      margin-left: 8px;
    }

    @keyframes spin {
      to { transform: rotate(360deg); }
    }
  </style>
</head>
<body onclick="focusPrompt(event)">

  <!-- Header -->
  <div id="termHeader">
    <div class="term-title">
      <div class="status-dot" title="Connected"></div>
      <span>root@UW-311VPW: <span id="headerPath">~</span></span>
      <span class="term-badge">Linux 2.6.36 SMP</span>
      <span class="term-badge">MIPS 34Kc @ 900MHz</span>
      <span class="term-badge" style="color:#39d353;">UID 0 (Root)</span>
    </div>
    <div class="header-actions">
      <button class="header-btn" onclick="clearScreen()">Clear (Ctrl+L)</button>
      <button class="header-btn" onclick="resetDir()">Reset Dir</button>
      <button class="header-btn" onclick="showHelp()">Help</button>
    </div>
  </div>

  <!-- Quick Command Bar -->
  <div id="quickBar">
    <span class="quick-label">Quick Commands:</span>
    <button class="quick-chip" onclick="execDirect('uname -a')">uname -a</button>
    <button class="quick-chip" onclick="execDirect('cat /proc/mtd')">cat /proc/mtd</button>
    <button class="quick-chip" onclick="execDirect('cat /proc/cpuinfo')">cpuinfo</button>
    <button class="quick-chip" onclick="execDirect('free')">free</button>
    <button class="quick-chip" onclick="execDirect('ifconfig')">ifconfig</button>
    <button class="quick-chip" onclick="execDirect('ps')">ps</button>
    <button class="quick-chip" onclick="execDirect('ls -la')">ls -la</button>
    <button class="quick-chip" onclick="execDirect('dmesg | tail -n 20')">dmesg</button>
    <button class="quick-chip" onclick="execDirect('cat /proc/meminfo')">meminfo</button>
  </div>

  <!-- Terminal Body -->
  <div id="terminalContainer" onclick="focusPrompt(event)">
    <div class="banner">
      <div>========================================================================</div>
      <div><span class="brand">Uniway UW-311VPW GPON/EPON Gateway</span> - Root Management Shell</div>
      <div>Hardware: <span class="highlight">EcoNet EN751221 (MIPS 34Kc Dual-VPE @ 900 MHz)</span></div>
      <div>Kernel: Linux 2.6.36 #6 SMP | BusyBox v1.00 | Root Filesystem: SquashFS/ramfs</div>
      <div>Privileges: <span class="highlight">Full Root (UID: 0, GID: 0) - All permissions granted.</span></div>
      <div>========================================================================</div>
      <div style="margin-top:6px;">Type standard Linux commands (<span style="color:#58a6ff;">ls</span>, <span style="color:#58a6ff;">cd</span>, <span style="color:#58a6ff;">cat</span>, <span style="color:#58a6ff;">ps</span>, <span style="color:#58a6ff;">cp</span>, <span style="color:#58a6ff;">rm</span>, <span style="color:#58a6ff;">vi</span>, <span style="color:#58a6ff;">reboot</span>). Use <span style="color:#e3b341;">'help'</span> for reference.</div>
    </div>

    <!-- Output History Appended Here -->
    <div id="termHistory"></div>

    <!-- Active Prompt Line -->
    <div id="activeLine">
      <div id="cmdPrompt">
        <span class="prompt-user">root@UW-311VPW</span><span class="prompt-colon">:</span><span class="prompt-path" id="promptCwd">~</span><span class="prompt-hash"># </span>
      </div>
      <div class="input-wrapper">
        <input type="text" id="cmdInput" autocomplete="off" autofocus spellcheck="false" onkeydown="handleKeyDown(event)">
        <span id="spinner" class="spinner" style="display:none;"></span>
      </div>
    </div>
  </div>

  <script>
    var currentCwd = "/boaroot/cgi-bin";
    var commandHistory = [];
    var historyIndex = -1;
    var isExecuting = false;

    // Common system commands for Tab autocomplete
    var autocompleteList = [
      "cat", "cd", "cp", "chmod", "chown", "clear", "cls", "cpuinfo",
      "date", "dd", "df", "dmesg", "echo", "exit", "free", "grep",
      "head", "help", "history", "ifconfig", "iptables", "kill", "killall",
      "ln", "ls", "mkdir", "mount", "mv", "netstat", "nslookup", "ping",
      "ps", "pwd", "reboot", "rm", "rmdir", "route", "sed", "sh", "sleep",
      "tar", "top", "traceroute", "umount", "uname", "uptime", "vi", "zcat",
      "/boaroot", "/tmp", "/etc", "/userfs", "/bin", "/sbin", "/proc", "/sys"
    ];

    function updatePromptDisplay() {
      var displayPath = currentCwd;
      if (displayPath === "/boaroot/cgi-bin") {
        displayPath = "~/cgi-bin";
      } else if (displayPath === "/root") {
        displayPath = "~";
      }
      document.getElementById("promptCwd").innerText = displayPath;
      document.getElementById("headerPath").innerText = displayPath;
    }
    updatePromptDisplay();

    function focusPrompt(e) {
      // Don't steal focus if user is actively selecting text to copy
      var selection = window.getSelection();
      if (selection && selection.toString().length > 0) return;
      
      var inp = document.getElementById("cmdInput");
      if (inp) inp.focus();
    }

    function clearScreen() {
      document.getElementById("termHistory").innerHTML = "";
      focusPrompt();
    }

    function resetDir() {
      currentCwd = "/boaroot/cgi-bin";
      updatePromptDisplay();
      focusPrompt();
    }

    function showHelp() {
      var helpText = `
=== UW-311VPW ROOT TERMINAL HELP ===
Navigation:
  cd <dir>         Change working directory (e.g. cd /tmp, cd /etc, cd /userfs)
  pwd              Print current working directory
  ls -la           List files with permissions & sizes

System & Hardware:
  uname -a         Kernel release & CPU architecture
  cat /proc/mtd    Flash memory partitions (mtd0 - mtd11)
  cat /proc/cpuinfo CPU details (MIPS 34Kc @ 900MHz Dual-VPE)
  free             RAM memory usage (Total, Used, Free)
  ifconfig         Network interface IP & MAC addresses
  ps               Running processes and services
  dmesg            Kernel boot and hardware logs

Filesystem Note:
  /               SquashFS (Read-Only SPI NOR Flash)
  /tmp & /var     Writable RAM (ramfs/tmpfs)
  /boaroot/cgi-bin Writable bind-mounted overlay

Keyboard Shortcuts:
  Enter            Run command
  Up / Down Arrow  Cycle command history
  Tab              Autocomplete command
  Ctrl + L         Clear terminal screen
  Ctrl + C         Cancel current input line
`;
      appendOutput("help", helpText);
    }

    function handleKeyDown(e) {
      if (isExecuting) return;

      if (e.keyCode === 13) { // Enter
        var cmd = document.getElementById("cmdInput").value.trim();
        if (cmd) {
          executeCommand(cmd);
        } else {
          // Just empty prompt
          appendEmptyLine();
        }
      } else if (e.keyCode === 38) { // Up Arrow
        e.preventDefault();
        if (commandHistory.length > 0) {
          if (historyIndex === -1) {
            historyIndex = commandHistory.length - 1;
          } else if (historyIndex > 0) {
            historyIndex--;
          }
          document.getElementById("cmdInput").value = commandHistory[historyIndex];
        }
      } else if (e.keyCode === 40) { // Down Arrow
        e.preventDefault();
        if (historyIndex !== -1) {
          if (historyIndex < commandHistory.length - 1) {
            historyIndex++;
            document.getElementById("cmdInput").value = commandHistory[historyIndex];
          } else {
            historyIndex = -1;
            document.getElementById("cmdInput").value = "";
          }
        }
      } else if (e.keyCode === 9) { // Tab
        e.preventDefault();
        handleTabComplete();
      } else if (e.ctrlKey && e.keyCode === 76) { // Ctrl + L
        e.preventDefault();
        clearScreen();
      } else if (e.ctrlKey && e.keyCode === 67) { // Ctrl + C
        e.preventDefault();
        appendCanceledLine();
      }
    }

    function handleTabComplete() {
      var inp = document.getElementById("cmdInput");
      var text = inp.value;
      var tokens = text.split(" ");
      var lastToken = tokens[tokens.length - 1];
      if (!lastToken) return;

      var matches = autocompleteList.filter(function(item) {
        return item.startsWith(lastToken);
      });

      if (matches.length === 1) {
        tokens[tokens.length - 1] = matches[0];
        inp.value = tokens.join(" ") + (matches[0].endsWith("/") ? "" : " ");
      }
    }

    function appendEmptyLine() {
      var historyDiv = document.getElementById("termHistory");
      var row = document.createElement("div");
      row.className = "term-row";
      row.innerHTML = `<span class="prompt-user">root@UW-311VPW</span><span class="prompt-colon">:</span><span class="prompt-path">${escapeHtml(document.getElementById('promptCwd').innerText)}</span><span class="prompt-hash"># </span>`;
      historyDiv.appendChild(row);
      scrollToBottom();
    }

    function appendCanceledLine() {
      var inp = document.getElementById("cmdInput");
      var val = inp.value;
      inp.value = "";
      historyIndex = -1;

      var historyDiv = document.getElementById("termHistory");
      var row = document.createElement("div");
      row.className = "term-row";
      row.innerHTML = `<span class="prompt-user">root@UW-311VPW</span><span class="prompt-colon">:</span><span class="prompt-path">${escapeHtml(document.getElementById('promptCwd').innerText)}</span><span class="prompt-hash"># </span><span class="cmd-executed">${escapeHtml(val)}</span><span style="color:#f85149;margin-left:4px;">^C</span>`;
      historyDiv.appendChild(row);
      scrollToBottom();
    }

    function appendOutput(cmd, outputText) {
      var historyDiv = document.getElementById("termHistory");

      var row = document.createElement("div");
      row.className = "term-row";
      var promptStr = `<span class="prompt-user">root@UW-311VPW</span><span class="prompt-colon">:</span><span class="prompt-path">${escapeHtml(document.getElementById('promptCwd').innerText)}</span><span class="prompt-hash"># </span><span class="cmd-executed">${escapeHtml(cmd)}</span>`;
      
      var outStr = `<div class="cmd-output">${escapeHtml(outputText)}</div>`;
      row.innerHTML = promptStr + outStr;

      historyDiv.appendChild(row);
      scrollToBottom();
    }

    function execDirect(cmd) {
      document.getElementById("cmdInput").value = cmd;
      executeCommand(cmd);
    }

    function executeCommand(cmd) {
      if (!cmd) return;

      // Handle client built-in commands
      var lowerCmd = cmd.toLowerCase().trim();
      if (lowerCmd === "clear" || lowerCmd === "cls") {
        document.getElementById("cmdInput").value = "";
        clearScreen();
        return;
      }
      if (lowerCmd === "help") {
        document.getElementById("cmdInput").value = "";
        showHelp();
        return;
      }
      if (lowerCmd === "history") {
        document.getElementById("cmdInput").value = "";
        var histOutput = commandHistory.map((c, i) => `  ${i + 1}  ${c}`).join("\n");
        appendOutput("history", histOutput || "No history yet.");
        return;
      }

      // Add to history
      commandHistory.push(cmd);
      historyIndex = -1;
      document.getElementById("cmdInput").value = "";

      isExecuting = true;
      document.getElementById("spinner").style.display = "inline-block";

      var currentPromptPath = document.getElementById("promptCwd").innerText;

      var xhr = new XMLHttpRequest();
      xhr.open("POST", "/cgi-bin/exec.cgi", true);
      xhr.setRequestHeader("Content-Type", "text/plain");
      xhr.setRequestHeader("X-CWD", currentCwd);

      xhr.onreadystatechange = function() {
        if (xhr.readyState === 4) {
          isExecuting = false;
          document.getElementById("spinner").style.display = "none";

          var raw = xhr.responseText || "";

          // Parse ___PWD_END___ marker
          var pwdMarker = "___PWD_END___:";
          var pwdIdx = raw.lastIndexOf(pwdMarker);
          var outputText = raw;

          if (pwdIdx !== -1) {
            var newPwd = raw.substring(pwdIdx + pwdMarker.length).trim();
            outputText = raw.substring(0, pwdIdx).trimRight();
            if (newPwd) {
              currentCwd = newPwd;
              updatePromptDisplay();
            }
          }

          if (xhr.status === 200) {
            appendOutput(cmd, outputText);
          } else {
            appendOutput(cmd, `[HTTP Error ${xhr.status}]: Failed to communicate with router backend.`);
          }

          focusPrompt();
        }
      };

      xhr.send(cmd);
    }

    function scrollToBottom() {
      var container = document.getElementById("terminalContainer");
      container.scrollTop = container.scrollHeight;
    }

    function escapeHtml(text) {
      if (!text) return "";
      return text
        .replace(/&/g, "&amp;")
        .replace(/</g, "&lt;")
        .replace(/>/g, "&gt;");
    }

    window.onload = function() {
      focusPrompt();
    };
  </script>
</body>
</html>
