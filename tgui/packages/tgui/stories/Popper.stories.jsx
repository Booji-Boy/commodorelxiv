import { Box, Popper } from '../components';

export const meta = {
  title: 'Popper',
  render: () => <Story />,
};

const Story = () => {
  return (
    <>
      <Popper
        isOpen
        content={
          <Box
            style={{
              background: 'white',
              border: '2px solid blue',
            }}
          >
            Loogatme!
          </Box>
        }
<<<<<<<< HEAD:tgui/packages/tgui/stories/Popper.stories.tsx
        placement="bottom"
========
        options={{
          placement: 'bottom',
        }}
>>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9:tgui/packages/tgui/stories/Popper.stories.jsx
      >
        <Box
          style={{
            border: '5px solid white',
            height: '300px',
            width: '200px',
          }}
        />
      </Popper>

      <Popper
        isOpen
        content={
          <Box
            style={{
              background: 'white',
              border: '2px solid blue',
            }}
          >
            I am on the right!
          </Box>
        }
<<<<<<<< HEAD:tgui/packages/tgui/stories/Popper.stories.tsx
        placement="right"
========
        options={{
          placement: 'right',
        }}
>>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9:tgui/packages/tgui/stories/Popper.stories.jsx
      >
        <Box
          style={{
            border: '5px solid white',
            height: '500px',
            width: '100px',
          }}
        />
      </Popper>
    </>
  );
};
