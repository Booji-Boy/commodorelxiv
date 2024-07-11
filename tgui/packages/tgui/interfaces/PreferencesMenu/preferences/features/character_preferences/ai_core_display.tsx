<<<<<<< HEAD
import {} from '../base';
import { FeatureIconnedDropdownInput, FeatureWithIcons } from '../dropdowns';
=======
import {
  FeatureIconnedDropdownInput,
  FeatureValueProps,
  FeatureChoicedServerData,
  FeatureChoiced,
} from '../base';
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9

export const preferred_ai_core_display: FeatureChoiced = {
  name: 'AI Core Display',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureIconnedDropdownInput buttons {...props} />;
  },
};
