#!/usr/bin/env node

const { argv } = process
const { spawn } = require('child_process')
const program = require('commander')

const { installDirectory } = require('../config.json')
const { addTask, addNote } = require('./fs')
const { show, task, note } = require('./predicates')

const match = pred => (...pairs) => pairs.reduce((cond, [p, f]) => cond ? cond : p(pred) ? (f(pred) || true) : false, false)
const openEditor = () =>
  spawn('nvim', [`${installDirectory}/tasks/`], { stdio: 'inherit' })
    .on('close', () => process.exit(0))

program
  .option('task [TASK]', 'create a new Task')
  .option('note [NOTE]', 'create a new Note')
  .option('-s, --show', 'show tasks in editor')
  .version('0.1.0', '-v, --version')
  .parse(argv)

match(program) ( 
  [ show, openEditor ],
  [ task, addTask ],
  [ note, addNote ],
  [ _ => true, p => p.outputHelp()]
)

