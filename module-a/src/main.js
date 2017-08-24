import React from 'react';
import { render } from 'react-dom';

import ModuleA from './ModuleA';

const rootEl = document.getElementById('app');

render(<ModuleA />, rootEl);