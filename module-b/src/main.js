import React from 'react';
import { render } from 'react-dom';

import ModuleB from './ModuleB';

const rootEl = document.getElementById('app');

render(<ModuleB />, rootEl);