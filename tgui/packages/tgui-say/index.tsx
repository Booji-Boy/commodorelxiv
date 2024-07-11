import './styles/main.scss';
<<<<<<< HEAD
=======
import { createRenderer } from 'tgui/renderer';
import { TguiSay } from './TguiSay';
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9

import { createRoot, Root } from 'react-dom/client';

import { TguiSay } from './TguiSay';

let reactRoot: Root | null = null;

document.onreadystatechange = function () {
  if (document.readyState !== 'complete') return;

  if (!reactRoot) {
    const root = document.getElementById('react-root');
    reactRoot = createRoot(root!);
  }

  reactRoot.render(<TguiSay />);
};
