import { backendUpdate, setGlobalStore } from 'tgui/backend';
import { DisposalUnit } from 'tgui/interfaces/DisposalUnit';
import { createRenderer } from 'tgui/renderer';
import { configureStore } from 'tgui/store';

const store = configureStore({ sideEffects: false });

const renderUi = createRenderer((dataJson: string) => {
  setGlobalStore(store);

  store.dispatch(
    backendUpdate({
      data: Byond.parseJson(dataJson),
    }),
<<<<<<< HEAD
=======
  );
  return (
    <StoreProvider store={store}>
      <DisposalUnit />
    </StoreProvider>
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
  );
  return <DisposalUnit />;
});

export const data = JSON.stringify({
  flush: 0,
  full_pressure: 1,
  pressure_charging: 0,
  panel_open: 0,
  per: 1,
  isai: 0,
});

export const Default = () => renderUi(data);
