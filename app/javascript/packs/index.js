import React from 'react';
import { render } from 'react-dom';
import Provider from '../components/Provider';
import VidCant from '../components/VidCant';

render(<Provider>
  <VidCant />
</Provider>, document.querySelector('#root'));