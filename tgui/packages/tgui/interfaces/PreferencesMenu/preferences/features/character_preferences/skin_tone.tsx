import { sortBy } from 'common/collections';
<<<<<<< HEAD
import { useMemo } from 'react';
import { Box, Dropdown, Stack } from 'tgui/components';

import { Feature, FeatureChoicedServerData, FeatureValueProps } from '../base';

type HexValue = {
  lightness: number;
  value: string;
};
=======
import {
  Feature,
  FeatureChoicedServerData,
  FeatureValueProps,
  HexValue,
  StandardizedPalette,
} from '../base';
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9

type SkinToneServerData = FeatureChoicedServerData & {
  display_names: NonNullable<FeatureChoicedServerData['display_names']>;
  to_hex: Record<string, HexValue>;
};

<<<<<<< HEAD
const sortHexValues = (array: [string, HexValue][]) =>
  sortBy(array, ([_, hexValue]) => -hexValue.lightness);
=======
const sortHexValues = sortBy<[string, HexValue]>(
  ([_, hexValue]) => -hexValue.lightness,
);
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9

export const skin_tone: Feature<string, string, SkinToneServerData> = {
  name: 'Skin Tone',
  component: (props: FeatureValueProps<string, string, SkinToneServerData>) => {
    const { handleSetValue, serverData } = props;

    if (!serverData) {
      return null;
    }

    const value = { value: props.value };

    const displayNames = useMemo(() => {
      const sorted = sortHexValues(Object.entries(serverData.to_hex));

      return sorted.map(([key, colorInfo]) => {
        const displayName = serverData.display_names[key];

        return {
          value: key,
          displayText: (
            <Stack align="center" fill key={key}>
              <Stack.Item>
                <Box
                  style={{
                    background: colorInfo.value,
                    boxSizing: 'content-box',
                    height: '11px',
                    width: '11px',
                  }}
                />
              </Stack.Item>

              <Stack.Item grow>{displayName}</Stack.Item>
            </Stack>
          ),
        };
      });
    }, [serverData.display_names]);

    return (
<<<<<<< HEAD
      <Dropdown
        buttons
        displayText={
          displayNames.find((option) => option.value === value.value)
            ?.displayText
        }
        onSelected={(value) => handleSetValue(value)}
        options={displayNames}
        selected={value.value}
        width="100%"
=======
      <StandardizedPalette
        choices={sortHexValues(Object.entries(serverData.to_hex)).map(
          ([key]) => key,
        )}
        choices_to_hex={Object.fromEntries(
          Object.entries(serverData.to_hex).map(([key, hex]) => [
            key,
            hex.value,
          ]),
        )}
        displayNames={serverData.display_names}
        onSetValue={handleSetValue}
        value={value}
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
      />
    );
  },
};
