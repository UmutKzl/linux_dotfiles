local o = vim.opt
local g = vim.g
local cmd = vim.cmd

g.mapleader = " "

o.number = true
o.relativenumber = true
o.cursorline = true

o.clipboard = "unnamedplus"

o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2
o.softtabstop = 2

o.updatetime = 400

cmd.colorscheme("tokyonight-night")
