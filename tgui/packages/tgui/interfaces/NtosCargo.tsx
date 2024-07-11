<<<<<<< HEAD
=======
import { CargoContent } from './Cargo.jsx';
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
import { NtosWindow } from '../layouts';
import { CargoContent } from './Cargo';

export const NtosCargo = (props) => {
  return (
    <NtosWindow width={800} height={500}>
      <NtosWindow.Content scrollable>
        <CargoContent />
      </NtosWindow.Content>
    </NtosWindow>
  );
};
